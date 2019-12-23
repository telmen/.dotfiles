#!/bin/bash

brew update
brew upgrade

BREW_PREFIX=$(brew --prefix)

brew install coreutils
brew install moreutils
brew install findutils

brew install \
    ack \
    adns \
    aircrack-ng \
    antigen \
    aom \
    applesimutils \
    apr \
    apr-util \
    argon2 \
    arp-scan \
    aspell \
    autoconf \
    autojump \
    automake \
    bash \
    bash-completion@2 \
    bat \
    bfg \
    binutils \
    binwalk \
    brotli \
    c-ares \
    cairo \
    carthage \
    cifer \
    cmake \
    cocoapods \
    curl-openssl \
    dex2jar \
    diff-so-fancy \
    dive \
    dns2tcp \
    elixir \
    erlang \
    exercism \
    fcrackzip \
    ffmpeg \
    flac \
    fontconfig \
    foremost \
    freetds \
    freetype \
    frei0r \
    fribidi \
    fzf \
    gcc \
    gdbm \
    gettext \
    giflib \
    git \
    git-extras \
    git-lfs \
    git-standup \
    gitlab-runner \
    glib \
    gmp \
    gnu-sed \
    gnupg \
    gnutls \
    graphite2 \
    grep \
    harfbuzz \
    hashpump \
    highlight \
    htop \
    httpie \
    hub \
    hydra \
    icu4c \
    ilmbase \
    imagemagick \
    isl \
    jansson \
    jasper \
    jemalloc \
    john \
    jpeg \
    jq \
    jump \
    knock \
    lame \
    ldns \
    leptonica \
    libass \
    libassuan \
    libbluray \
    libde265 \
    libdnet \
    libdvdcss \
    libev \
    libevent \
    libffi \
    libgcrypt \
    libgpg-error \
    libheif \
    libidn \
    libidn2 \
    libksba \
    libmetalink \
    libmpc \
    libogg \
    libomp \
    libpcap \
    libpng \
    libpq \
    libsamplerate \
    libsndfile \
    libsodium \
    libsoxr \
    libssh2 \
    libtasn1 \
    libtiff \
    libtool \
    libunistring \
    libusb \
    libvorbis \
    libvpx \
    libyaml \
    libzip \
    little-cms2 \
    lua \
    lynx \
    mongodb-community \
    mpfr \
    mysql-client \
    ncurses \
    netpbm \
    nettle \
    nghttp2 \
    ninja \
    nmap \
    node \
    npth \
    oniguruma \
    opencore-amr \
    openexr \
    openjpeg \
    openldap \
    openssh \
    openssl \
    opus \
    p11-kit \
    p7zip \
    pango \
    pcre \
    pcre2 \
    perl \
    phantomjs \
    php \
    pigz \
    pinentry \
    pixman \
    pkg-config \
    pngcheck \
    powerlevel9k \
    pv \
    python \
    python@2 \
    qt \
    readline \
    rename \
    ripgrep \
    rlwrap \
    rtmpdump \
    rubberband \
    ruby \
    screen \
    sdl2 \
    sfnt2woff \
    sfnt2woff-zopfli \
    shared-mime-info \
    shfmt \
    snappy \
    socat \
    speex \
    sphinx-doc \
    sqlite \
    sqlmap \
    ssdeep \
    ssh-copy-id \
    tcpflow \
    tcpreplay \
    tcptrace \
    tesseract \
    theora \
    tidy-html5 \
    tmux \
    tree \
    ucspi-tcp \
    unbound \
    unixodbc \
    vbindiff \
    watchman \
    webp \
    wget \
    wifi-password \
    woff2 \
    wxmac \
    x264 \
    x265 \
    xpdf \
    xvid \
    xz \
    yarn \
    zopfli \
    fish

# brew casks

brew tap caskroom/caskroom
brew cask install              \
    fastlane                   \
    qlimagesize                \
    quicklookase               \
    fing                       \
    qlmarkdown                 \
    react-native-debugger      \
    font-hack-nerd-font        \
    qlstephen                  \
    reactotron                 \
    kap                        \
    qlvideo                    \
    suspicious-package         \
    qlcolorcode                \
    quicklook-json             \
    webpquicklook              \
    iterm2


brew cleanup
