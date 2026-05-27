# Phase I-12 — Homebrew formula scaffold for ``ulmentflam/homebrew-tap``.
#
# Deploy by copying this file to ``Formula/corpus-forge.rb`` in the
# tap repo (``https://github.com/ulmentflam/homebrew-tap``). On each
# corpus-forge release, update ``url`` to the GitHub tag URL and
# ``sha256`` to the matching wheel's SHA-256. A release-CI job can
# automate this with ``brew bump-formula-pr``.
#
# Install:
#   brew install ulmentflam/tap/corpus-forge
#
# Upgrade (corpus-forge ``update`` subcommand auto-detects the brew
# channel and runs this for you):
#   brew upgrade corpus-forge
class CorpusForge < Formula
  include Language::Python::Virtualenv

  desc "Forge a living, trainable corpus from notes, code, and chat history"
  homepage "https://github.com/ulmentflam/corpus-forge"
  url "https://github.com/ulmentflam/corpus-forge/archive/refs/tags/v0.1.0b10.tar.gz"
  # Update this on each release. ``shasum -a 256 corpus-forge-<version>.tar.gz``
  sha256 "cf58334cca3a3bb43416b494fa8872d4b042feceaba1baaa2a1a55e87aadfcaf"
  license "Apache-2.0"
  head "https://github.com/ulmentflam/corpus-forge.git", branch: "main"

  depends_on "python@3.12"

  # Recommended deps, ordered alphabetically to satisfy
  # FormulaAudit/DependencyOrder. ``ffmpeg``/``poppler`` are optional
  # runtime deps unlocked by the ``[whisper]`` and ``[ocr]`` extras;
  # ``uv`` backs the in-app ``update`` path. All are recommended so
  # users can opt out (e.g. ``--without-poppler``).
  depends_on "ffmpeg" => :recommended
  depends_on "poppler" => :recommended
  depends_on "uv" => :recommended

  def install
    virtualenv_install_with_resources
  end

  test do
    # Smoke: --version prints a reasonable string.
    assert_match "corpus-forge version", shell_output("#{bin}/corpus-forge --version")
    # Smoke: doctor exits 0 on a fresh install (config will be WARN
    # but doctor's healthy invariant tolerates WARN for that check).
    system "#{bin}/corpus-forge", "doctor"
  end
end
