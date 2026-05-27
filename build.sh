#!/usr/bin/env bash
set -euo pipefail

SRC="${1:-src}"
OUT="${2:-out}"
JOBS="${JOBS:-$(nproc)}"

SECTIONS=(man1 man2 man2const man2type man3 man3attr man3const man3head man3type man4 man5 man6 man7 man8)

declare -A SECTION_DESC
SECTION_DESC[man1]="User commands"
SECTION_DESC[man2]="System calls"
SECTION_DESC[man2const]="System call constants"
SECTION_DESC[man2type]="System call types"
SECTION_DESC[man3]="Library functions"
SECTION_DESC[man3attr]="Library function attributes"
SECTION_DESC[man3const]="Library constants"
SECTION_DESC[man3head]="Library headers"
SECTION_DESC[man3type]="Library types"
SECTION_DESC[man4]="Device files"
SECTION_DESC[man5]="File formats"
SECTION_DESC[man6]="Games"
SECTION_DESC[man7]="Miscellaneous"
SECTION_DESC[man8]="System administration"

mkdir -p "$OUT"
cp style.css "$OUT/style.css"
cp nav.js "$OUT/nav.js"
mkdir -p "$OUT/hljs"
cp assets/hljs/highlight.min.js "$OUT/hljs/highlight.min.js"
cp assets/hljs/atom-one-dark.min.css "$OUT/hljs/atom-one-dark.min.css"

extract_desc() {
  awk '
    /^\.SH NAME/{f=1; buf=""; next}
    f && /^\.SH/{exit}
    f && /^\./{ next }
    f { buf = buf " " $0 }
    END {
      gsub(/\\f[BIRP]/, "", buf)
      gsub(/\\-/, "-", buf)
      gsub(/^ +| +$/, "", buf)
      if (match(buf, / - /)) sub(/.* - /, "", buf)
      gsub(/^ +| +$/, "", buf)
      print buf
    }
  ' "$1"
}

convert_page() {
  local src="$1" secdir="$2" out_dir="$3"
  local name sec_num desc
  name=$(basename "$src")
  local out="$out_dir/$name.html"
  local title="${name%.*}"
  sec_num="${secdir#man}"

  desc=$(extract_desc "$src")

  pandoc -f man -t html5 \
    --template template.html \
    --variable "section=$sec_num" \
    --variable "secdir=$secdir" \
    --variable "pagetitle=$title" \
    --metadata "pagetitle=$title" \
    --metadata "description=$desc" \
    -o "$out" "$src" 2>/dev/null || return 0

  # remove pandoc's NAME h1 + description paragraph (replaced by template header)
  perl -i -0pe 's|<h1>NAME</h1>\s*<p>.*?</p>\s*||s' "$out"

  # link cross-references: <strong>name</strong>(sec) → <a href="/manSEC/name.sec.html">
  sed -i -E \
    's|<strong>([^<]+)</strong>\(([0-9][a-z]*)\)|<a href="/man\2/\1.\2.html"><strong>\1</strong>(\2)</a>|g' \
    "$out"
}

export -f convert_page extract_desc

echo "Building man pages from $SRC → $OUT"

for section in "${SECTIONS[@]}"; do
  src_dir="$SRC/$section"
  [[ -d "$src_dir" ]] || continue

  out_dir="$OUT/$section"
  mkdir -p "$out_dir"

  pages=("$src_dir"/*)
  count=${#pages[@]}
  echo "  $section: $count pages"

  printf '%s\n' "${pages[@]}" | \
    xargs -P "$JOBS" -I{} bash -c 'convert_page "$@"' _ {} "$section" "$out_dir" || true
done

echo "Generating index pages..."

generate_section_index() {
  local section="$1" out_dir="$2"
  local desc="${SECTION_DESC[$section]:-}"
  local index="$out_dir/index.html"
  local sec_num="${section#man}"

  {
    cat <<HTML
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Section $sec_num ($desc) - man pages</title>
  <link rel="stylesheet" href="/style.css">
  <link rel="stylesheet" href="/pagefind/pagefind-ui.css">
</head>
<body>
  <header class="site-header">
    <a href="/" class="home-link">man pages</a>
    <div id="search"></div>
  </header>
  <nav class="breadcrumb" aria-label="breadcrumb">
    <a href="/">home</a>
    <span aria-hidden="true">/</span>
    <span class="current">section $sec_num</span>
  </nav>
  <div class="page-list">
    <div class="page-list-header">
      <h2>$section — $desc</h2>
HTML

    local files count=0
    for f in "$out_dir"/*.html; do
      [[ "$(basename "$f")" == "index.html" ]] && continue
      (( count++ )) || true
    done
    echo "      <span class=\"page-count\">$count pages</span>"
    echo "    </div>"
    echo "    <div class=\"page-grid\" data-pagefind-ignore>"

    for f in $(ls "$out_dir"/*.html 2>/dev/null | sort); do
      local fname
      fname=$(basename "$f")
      [[ "$fname" == "index.html" ]] && continue
      local pagename="${fname%.html}"
      echo "      <a class=\"page-link\" href=\"/$section/$fname\">$pagename</a>"
    done

    cat <<HTML
    </div>
  </div>
  <script src="/pagefind/pagefind-ui.js"></script>
  <script src="/nav.js"></script>
</body>
</html>
HTML
  } > "$index"
}

for section in "${SECTIONS[@]}"; do
  out_dir="$OUT/$section"
  [[ -d "$out_dir" ]] || continue
  generate_section_index "$section" "$out_dir"
done

echo "Generating root index..."
{
  cat <<'HTML'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>Linux man pages</title>
  <link rel="stylesheet" href="/style.css">
  <link rel="stylesheet" href="/pagefind/pagefind-ui.css">
</head>
<body>
  <header class="site-header">
    <a href="/" class="home-link">man pages</a>
    <div id="search"></div>
  </header>
  <div class="index-header">
    <h1>Linux man pages</h1>
    <p>Linux man-pages 6.18 · Michael Kerrisk</p>
  </div>
  <div class="section-grid" data-pagefind-ignore>
HTML

  declare -A descs=(
    [man1]="User commands"       [man2]="System calls"
    [man2const]="Constants"      [man2type]="Types"
    [man3]="Library functions"   [man3attr]="Attributes"
    [man3const]="Constants"      [man3head]="Headers"
    [man3type]="Types"           [man4]="Device files"
    [man5]="File formats"        [man6]="Games"
    [man7]="Miscellaneous"       [man8]="Administration"
  )

  for section in "${SECTIONS[@]}"; do
    out_dir="$OUT/$section"
    [[ -d "$out_dir" ]] || continue
    sec_num="${section#man}"
    desc="${descs[$section]:-}"
    count=$(ls "$out_dir"/*.html 2>/dev/null | grep -vc "index.html" || true)
    echo "    <a class=\"section-card\" href=\"/$section/index.html\">"
    echo "      <div class=\"num\">$sec_num</div>"
    echo "      <div class=\"label\">$desc</div>"
    echo "      <div class=\"count\">$count pages</div>"
    echo "    </a>"
  done

  cat <<'HTML'
  </div>
  <script src="/pagefind/pagefind-ui.js"></script>
  <script src="/nav.js"></script>
</body>
</html>
HTML
} > "$OUT/index.html"

echo "Running pagefind..."
npx pagefind --site "$OUT" --output-path "$OUT/pagefind"

echo ""
echo "Done. Serve with: miniserve $OUT --index index.html"
