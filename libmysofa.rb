class Libmysofa < Formula
  desc "Library for reading AES SOFA files"
  homepage "https://github.com/hoene/libmysofa"
  url "https://github.com/hoene/libmysofa/archive/v1.0.tar.gz"
  sha256 "0b3866cf4c4245124ad6e7e6395f1d9cbcc121cccc6b280ff70052f84d97408d"
  head "https://github.com/hoene/libmysofa.git"

  depends_on "cmake" => :build

  depends_on "cunit"

  def install
    opts = "-Ofast -march=native -mtune=native -flto=thin -fwhole-program-vtables -ffunction-sections -fdata-sections"
    ENV.append "CFLAGS",      opts
    ENV.append "CPPFLAGS",    opts
    ENV.append "CXXFLAGS",    opts
    ENV.append "OBJCFLAGS",   opts
    ENV.append "OBJCXXFLAGS", opts
    ENV.append "LDFLAGS",     opts + " -dead_strip"

    cd "build" do
      system "cmake", "..", *std_cmake_args, "-DCMAKE_BUILD_TYPE=Release"
      system "make", "all"
      system "make", "install"
    end
  end
end
