---
name: gpt-image-2-transparent-codex-cli-image-gen
description: Use for transparent GPT Image 2 PNGs via CLIProxyAPI.
---

# GPT Image 2 Transparent Codex CLI Image Gen

## Prerequisites

- CLIProxyAPI installed at `C:\Users\josep\AppData\Local\CLIProxyAPI`
- CLIProxyAPI running on `http://localhost:8317`
- Codex OAuth credentials authenticated under `C:\Users\josep\.cli-proxy-api\`
- A local proxy API key configured in `config.yaml`

Start the proxy if needed:

```bash
cd /c/Users/josep/AppData/Local/CLIProxyAPI
./cli-proxy-api.exe -config config.yaml
```

Authenticate Codex if no Codex account appears:

```bash
./cli-proxy-api.exe -config config.yaml -codex-login
```

## Model routing

This transparent workflow uses the direct `gpt-image-2` Images API through CLIProxyAPI. It does not invoke a Codex text-agent turn, so there is no intermediate text model or stdin processing. If a Codex CLI wrapper is used instead, it must invoke `codex exec --skip-git-repo-check -m gpt-5.6-luna` before `/imagegen`.

## Generate a transparent PNG

```bash
curl -sS --max-time 180 \
  http://localhost:8317/v1/images/generations \
  -H 'Authorization: Bearer YOUR_LOCAL_PROXY_KEY' \
  -H 'Content-Type: application/json' \
  -d '{"model":"gpt-image-2","prompt":"A cute cat isolated as a clean sticker with transparent surroundings","background":"transparent","output_format":"png"}' \
  > cliproxy-response.json
```

Decode the returned base64 PNG:

```bash
python -c "import json,base64; p=json.load(open('cliproxy-response.json'))['data'][0]['b64_json']; open('output.png','wb').write(base64.b64decode(p))"
```

Use the local key from `config.yaml`; never expose or commit it.

## Verify the result

A valid transparent result should be PNG, RGBA/RGBA-compatible, and contain both transparent and opaque pixels:

```bash
python -c "from PIL import Image; im=Image.open('output.png'); print(im.format,im.size,im.mode,'alpha_extrema=',im.getchannel('A').getextrema() if 'A' in im.getbands() else None)"
```

Expected shape:

```text
PNG (width, height) RGBA alpha_extrema= (0, 255)
```

## Required transparent API method

Use `POST /v1/images/generations`, not `/v1/images/edits`, for transparent output. Send JSON with `model`, `prompt`, `n`, `size`, `response_format: "b64_json"`, `output_format: "png"`, and explicit `background: "transparent"` outside the prompt. Prompt wording must describe only the isolated subject/overlay and must not mention scenery or a background. The response's background field is not proof of transparency; decode and verify PIL reports RGBA with alpha extrema `(0,255)`.

## Codex CLI reference-image workflow

When using the Codex CLI with a local reference image, pass the reference with `-i <absolute-path>` and put the complete `/imagegen ...` request on stdin. Do not pass the prompt as a positional argument and do not append a trailing `-` after the `-i` option. For reliable output, run one generation at a time with an isolated `CODEX_HOME` containing copies of `auth.json` and `config.toml`, and use `--sandbox workspace-write`. Codex can print `orchestrator_helper_incomplete` errors while still writing the actual PNG, so always inspect the isolated home under `generated_images/<session-id>/` and validate the discovered file with PIL before accepting it. Codex 0.154.0 may name the result `exec-*.png`; do not assume only `call_*.png` or `ig_*.png`.

Example:

```bash
CODEX_HOME="C:/path/to/isolated-home" codex exec --skip-git-repo-check --sandbox workspace-write -m gpt-5.6-luna -i "C:/path/reference.png" < prompt.txt
```

The prompt file must begin with `/imagegen`. Copy the validated output into the destination only after checking it is a real PNG and has the expected dimensions/mode. For transparent assets, require RGBA with alpha extrema `(0,255)`. For opaque background plates, require RGB/RGBA with a fully opaque alpha channel or RGB mode.

## Known limitation

The direct unofficial `codex-imagegen-cli` wrapper correctly forwards `background: transparent`, but the direct Codex backend returns HTTP 400: `Transparent background is not supported for this model.` CLIProxyAPI is the verified working route because it exposes `gpt-image-2` through an OpenAI-compatible images endpoint.
