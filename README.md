<p align="center">
  <a href="https://www.autom.dev"><img src="images/banner.png" alt="Google Images API by Autom" width="100%"></a>
</p>

# Google Images API

[![Discord](https://img.shields.io/badge/Discord-Join%20the%20community-5865F2?logo=discord&logoColor=white)](https://discord.gg/CFj3ph8aHU) [![Get API key](https://img.shields.io/badge/Autom-Get%20an%20API%20key-111827)](https://app.autom.dev/register) [![API docs](https://img.shields.io/badge/Docs-API%20reference-0EA5E9)](https://docs.autom.dev) [![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)

The **Autom Google Images API** returns Google Images results — image URLs, sources and titles — as structured JSON.

- **Google Images API** — Search Google Images via API and retrieve image results (URLs, titles, sources, dimensions).

Use it for visual research, dataset building or brand monitoring.

| Endpoint | Request | Credits |
|---|---|---|
| [Google Images API](#google-images-api) | `GET /v1/google/images` | 1 |

## Table of contents

- [How it works](#how-it-works)
- [Google Images API](#google-images-api)
- [Code examples in other languages](#code-examples-in-other-languages)
- [Use cases](#use-cases)
- [Why Autom?](#why-autom)
- [FAQ](#faq)
- [Related repositories](#related-repositories)
- [Support](#support)

## How it works

1. **Create a Autom account** and copy your API key from the [dashboard](https://app.autom.dev/register).
2. **Call `https://api.autom.dev`** with the header `x-api-key: YOUR_API_KEY`.
3. **Use the result** in your app — no infrastructure to run.

```bash
export AUTOM_API_KEY="your-api-key"
pip install requests        # Python
# TypeScript: Node.js 18+ (native fetch), run with `npx tsx file.ts`
```

## Google Images API

Search Google Images via API and retrieve image results (URLs, titles, sources, dimensions).

`GET https://api.autom.dev/v1/google/images` · **1 credit per request** · [API reference](https://app.autom.dev/openapi)

### Request parameters

| Parameter | In | Type | Required | Description |
|---|---|---|---|---|
| `query` | query | string | ✅ | Query you want to search on Google Images (e.g. "lion", "nike logo", "modern house exterior"). |
| `page` | query | number | — | Page number for pagination (1 = first page). |
| `gl` | query | string | — | Country to use for the search (two-letter country code, e.g. `us`, `fr`). |
| `hl` | query | string | — | Language to use for the search (two-letter language code, e.g. `en`, `fr`). |
| `google_domains` | query | string | — | Google domain to use (e.g. `google.com`, `google.fr`). |
| `async` | query | boolean | — | If true, returns a job and lets you fetch results asynchronously. |

### Python example

```python
import os

import requests

API_KEY = os.environ["AUTOM_API_KEY"]
HEADERS = {"x-api-key": API_KEY}

response = requests.get(
    "https://api.autom.dev/v1/google/images",
    headers=HEADERS,
    params={
        "query": "lion",
    },
    timeout=120,
)
response.raise_for_status()

data = response.json()
print(data)
```

### TypeScript example

```typescript
type GoogleImagesApi = {
  images?: {
    url?: string;
    link?: string;
    title?: string;
    domain?: string;
    source?: string;
    position?: number;
    image_width?: number;
    image_height?: number;
  }[];
  search_parameters?: {
    q?: string;
    gl?: string;
    hl?: string;
    page?: number;
    engine?: string;
  };
};

const headers = { "x-api-key": process.env.AUTOM_API_KEY!, "Content-Type": "application/json" };

const params = new URLSearchParams({
  "query": "lion",
});

const response = await fetch(`https://api.autom.dev/v1/google/images?${params}`, { headers });
if (!response.ok) throw new Error(`HTTP ${response.status}: ${await response.text()}`);

const data = (await response.json()) as GoogleImagesApi;
console.log(data);
```

### Output example

Example response from the API reference, abridged.

```json
{
  "images": [
    {
      "url": "https://upload.wikimedia.org/wikipedia/commons/thumb/7/73/Lion_waiting_in_Namibia.jpg/1200px-Lion_waiting_in_Namibia.jpg",
      "link": "https://en.wikipedia.org/wiki/Lion",
      "title": "Lion - Wikipedia",
      "domain": "en.wikipedia.org",
      "source": "Wikipedia",
      "position": 1,
      "image_width": 1200,
      "image_height": 900
    }
  ],
  "search_parameters": {
    "q": "lion",
    "gl": "us",
    "hl": "en",
    "page": 1,
    "engine": "google"
  }
}
```

### Response fields

| Field | Type | Description |
|---|---|---|
| `images[]` | object[] |  |
| `images[].url` | string |  |
| `images[].link` | string |  |
| `images[].title` | string |  |
| `images[].domain` | string |  |
| `images[].source` | string |  |
| `images[].position` | integer |  |
| `images[].image_width` | integer |  |
| `images[].image_height` | integer |  |
| `search_parameters` | object |  |
| `search_parameters.q` | string |  |
| `search_parameters.gl` | string |  |
| `search_parameters.hl` | string |  |
| `search_parameters.page` | integer |  |
| `search_parameters.engine` | string |  |

## Code examples in other languages

Ready-to-run examples live in [`examples/`](examples); each reads your key from `AUTOM_API_KEY`.

| Language | `google-images` |
|---|---|
| cURL (Bash) | [google_images.sh](examples/curl/google_images.sh) |
| PHP | [google_images.php](examples/php/google_images.php) |
| C# | [GoogleImages.cs](examples/csharp/GoogleImages.cs) |
| Go | [google_images.go](examples/go/google_images.go) |
| Java | [GoogleImagesExample.java](examples/java/GoogleImagesExample.java) |
| Ruby | [google_images.rb](examples/ruby/google_images.rb) |
| Node.js | [google_images.mjs](examples/nodejs/google_images.mjs) |

## Use cases

- **Visual research** — Collect image results for a topic.
- **Brand monitoring** — Find where your visuals appear.

## Why Autom?

- **Every SERP in one API** — Google Search, AI Mode, Maps, News, Shopping, Images, Videos, Jobs, Autocomplete, plus Bing and Brave.
- **Structured JSON** — documented fields instead of brittle HTML parsing.
- **Geo & language targeting** — search like a user from the country and language you need.
- **One API key, one header** — `x-api-key` on every request.
- **Copy-paste examples** — Python and TypeScript in each README, 7 more languages in `examples/`.

## FAQ

### How do I authenticate?

Create an account on [Autom](https://app.autom.dev/register), copy your API key and send it in the `x-api-key` header of every request to `https://api.autom.dev`.

### How much does a request cost?

Credits per call: `/v1/google/images` **1**. See [Autom pricing](https://www.autom.dev/pricing).

### Which languages are supported?

Any language that can make an HTTP request. This README shows Python and TypeScript; the [`examples/`](examples) folder contains cURL, PHP, C#, Go, Java, Ruby and Node.js.

## Related repositories

- [Google Search API](https://github.com/automdev/google-search-api)
- [Google AI Mode API](https://github.com/automdev/google-ai-mode-api)
- [Google Maps API](https://github.com/automdev/google-maps-api)
- [Google News API](https://github.com/automdev/google-news-api)
- [Google Shopping API](https://github.com/automdev/google-shopping-api)
- [Google Videos API](https://github.com/automdev/google-videos-api)
- [Google Jobs API](https://github.com/automdev/google-jobs-api)
- [Google Autocomplete API](https://github.com/automdev/google-autocomplete-api)
- [All Autom repositories](https://github.com/automdev)

## Support

- 💬 Join the [Discord](https://discord.gg/CFj3ph8aHU) to ask questions and share what you build.
- 📚 Read the [API reference](https://docs.autom.dev).
- 🔑 [Get your API key](https://app.autom.dev/register).

---

<p align="center">
  <a href="https://www.autom.dev">
    <picture>
      <source media="(prefers-color-scheme: dark)" srcset="images/logo-dark.svg">
      <img src="images/logo.svg" alt="Autom" height="28">
    </picture>
  </a>
  <br>
  <sub>Built by <a href="https://www.autom.dev">Autom</a>. Examples are released under the MIT license.</sub>
</p>
