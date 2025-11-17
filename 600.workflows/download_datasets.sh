#!/bin/bash
set -euo pipefail

URL="https://polybox.ethz.ch/index.php/s/fw7ARb7cRz5cnnN/download"
ARCHIVE="workflow-data.tar.gz"
BASE_DIR="$(dirname "$0")"

cd "$BASE_DIR"

if ! wget -O "$ARCHIVE" "$URL"; then
  echo "Failed to download dataset archive" >&2
  exit 1
fi

mkdir -p 6100.1000-genome 6101.1000-genome-individuals 631.parallel-download 650.vid 660.map-reduce

tar -xzf "$ARCHIVE" \
  --directory . \
  --strip-components=2 \
  benchmarks-data/600.workflows/6100.1000-genome/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5.20130502.sites.annotation.vcf \
  benchmarks-data/600.workflows/6101.1000-genome-individuals/ALL.chr21.phase3_shapeit2_mvncall_integrated_v5.20130502.sites.annotation.vcf \
  benchmarks-data/600.workflows/631.parallel-download/data-1048576-bytes.txt \
  benchmarks-data/600.workflows/650.vid/frozen_inference_graph.pb \
  benchmarks-data/600.workflows/660.map-reduce/words

echo "Datasets extracted under benchmarks-data/600.workflows"
