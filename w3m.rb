class W3m < Formula
    desc "w3m is a text-based web browser and pager"
    homepage "https://github.com/shinh/w3m"
    url "https://deb.debian.org/debian/pool/main/w/w3m/w3m_0.5.3.orig.tar.gz" # Update with the correct URL
    sha256 "e994d263f2fd2c22febfbe45103526e00145a7674a0fda79c822b97c2770a9e3" # Update with the actual SHA256 sum of the tarball
  
    def install
        ENV.append_to_cflags "-Wno-implicit-function-declaration" if DevelopmentTools.clang_build_version >= 1200
    
        system "./configure", "--prefix=#{prefix}",
                              "--enable-image",
                              "--with-imagelib=imlib2",
                              "--with-ssl=#{Formula["openssl@3"].opt_prefix}"
        system "make", "install"
    end
  end