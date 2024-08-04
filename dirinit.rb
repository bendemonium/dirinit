class Dirtree < Formula
  desc "Create directory structures from tree-like, indented, or path text representations"
  homepage "https://github.com/bendemonium/init"
  url "https://github.com/bendemonium/dirinit/archive/v1.0.0.tar.gz"
  sha256 "THE_SHA256_HASH_OF_YOUR_TARBALL"
  license "MIT"

  depends_on "newt"

  def install
    bin.install "dirtree"
  end

  test do
    (testpath/"test_tree.txt").write <<~EOS
      ├── dir1
      │   ├── file11.ext
      │   └── file12.ext
      └── dir2
          └── file21.ext
    EOS
    system "#{bin}/dirtree", "-t", "test_tree.txt"
    assert_predicate testpath/"dir1/file11.ext", :exist?
    assert_predicate testpath/"dir1/file12.ext", :exist?
    assert_predicate testpath/"dir2/file21.ext", :exist?

    (testpath/"test_indent.txt").write <<~EOS
      dir3
        file31.ext
        file32.ext
      dir4
        file41.ext
    EOS
    system "#{bin}/dirtree", "-i", "test_indent.txt"
    assert_predicate testpath/"dir3/file31.ext", :exist?
    assert_predicate testpath/"dir3/file32.ext", :exist?
    assert_predicate testpath/"dir4/file41.ext", :exist?

    (testpath/"test_path.txt").write <<~EOS
      dir5/file51.ext
      dir5/dir6/file61.ext
    EOS
    system "#{bin}/dirtree", "-p", "test_path.txt"
    assert_predicate testpath/"dir5/file51.ext", :exist?
    assert_predicate testpath/"dir5/dir6/file61.ext", :exist?
  end
end
