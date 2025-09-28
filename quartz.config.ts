import { QuartzConfig } from "./quartz/cfg"
import * as Plugin from "./quartz/plugins"

/**
 * Quartz 4 Configuration
 *
 * See https://quartz.jzhao.xyz/configuration for more information.
 */
const config: QuartzConfig = {
  configuration: {
    pageTitle: "Implicit",
    pageTitleSuffix: "",
    enableSPA: true,
    enablePopovers: false,
    analytics: {
      provider: "plausible",
    },
    locale: "en-US",
    baseUrl: "implicit.ink",
    ignorePatterns: [
      "private",
      "templates",
      ".obsidian",
      "**/Templates/**",
      "**/Drafts/**",
      "**/Personal/**",
      "**/Work/**",
      "**/Ideas/**",
      "**/Knowledge/**",
      "**/*draft*",
      "**/README.md"
    ],
    defaultDateType: "modified",
    theme: {
      fontOrigin: "googleFonts",
      cdnCaching: true,
      typography: {
        header: {
          name: "Space Grotesk",
          weights: [400, 500, 600, 700],
          includeItalic: false,
        },
        body: {
          name: "Inter",
          weights: [400, 500, 600],
          includeItalic: false,
        },
        code: {
          name: "JetBrains Mono",
          weights: [400, 500, 600],
          includeItalic: false,
        },
      },
      colors: {
        lightMode: {
          light: "#ffffff",
          lightgray: "#f1f3f4",
          gray: "#9ca3af",
          darkgray: "#374151",
          dark: "#111827",
          secondary: "#2563eb",
          tertiary: "#8b5cf6",
          highlight: "rgba(37, 99, 235, 0.05)",
          textHighlight: "#fef3c7",
        },
        darkMode: {
          light: "#0f172a",
          lightgray: "#1e293b",
          gray: "#64748b",
          darkgray: "#cbd5e1",
          dark: "#f8fafc",
          secondary: "#3b82f6",
          tertiary: "#a855f7",
          highlight: "rgba(59, 130, 246, 0.1)",
          textHighlight: "#422006",
        },
      },
    },
  },
  plugins: {
    transformers: [
      Plugin.FrontMatter(),
      Plugin.CreatedModifiedDate({
        priority: ["frontmatter", "git", "filesystem"],
      }),
      Plugin.SyntaxHighlighting({
        theme: {
          light: "github-light",
          dark: "github-dark",
        },
        keepBackground: false,
      }),
      Plugin.ObsidianFlavoredMarkdown({ enableInHtmlEmbed: false }),
      Plugin.GitHubFlavoredMarkdown(),
      Plugin.TableOfContents(),
      Plugin.CrawlLinks({ markdownLinkResolution: "shortest" }),
      Plugin.Description(),
      Plugin.Latex({ renderEngine: "katex" }),
    ],
    filters: [
      Plugin.RemoveDrafts(),
      Plugin.ExplicitPublish()
    ],
    emitters: [
      Plugin.AliasRedirects(),
      Plugin.ComponentResources(),
      Plugin.ContentPage(),
      Plugin.FolderPage(),
      Plugin.TagPage(),
      Plugin.ContentIndex({
        enableSiteMap: true,
        enableRSS: true,
      }),
      Plugin.Assets(),
      Plugin.Static(),
      Plugin.Favicon(),
      Plugin.NotFoundPage(),
      // Comment out CustomOgImages to speed up build time
      // Plugin.CustomOgImages(),
    ],
  },
}

export default config
