// swift-tools-version:5.9

import PackageDescription

let package = Package(
    name: "MPVKit",
    platforms: [.macOS(.v12), .iOS(.v15), .tvOS(.v15), .visionOS(.v1)],
    products: [
        .library(
            name: "MPVKit",
            targets: ["_MPVKit"]
        ),
        .library(
            name: "MPVKit-GPL",
            targets: ["_MPVKit-GPL"]
        ),
    ],
    targets: [
        .target(
            name: "_MPVKit",
            dependencies: [
                "Libmpv", "_FFmpeg", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg",
            dependencies: [
                "Libavcodec", "Libavdevice", "Libavfilter", "Libavformat", "Libavutil", "Libswresample", "Libswscale",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),
        .target(
            name: "_MPVKit-GPL",
            dependencies: [
                "Libmpv-GPL", "_FFmpeg-GPL", "Libuchardet", "Libbluray",
                .target(name: "Libluajit", condition: .when(platforms: [.macOS])),
            ],
            path: "Sources/_MPVKit-GPL",
            linkerSettings: [
                .linkedFramework("AVFoundation"),
                .linkedFramework("CoreAudio"),
            ]
        ),
        .target(
            name: "_FFmpeg-GPL",
            dependencies: [
                "Libavcodec-GPL", "Libavdevice-GPL", "Libavfilter-GPL", "Libavformat-GPL", "Libavutil-GPL", "Libswresample-GPL", "Libswscale-GPL",
                "Libssl", "Libcrypto", "Libass", "Libfreetype", "Libfribidi", "Libharfbuzz",
                "MoltenVK", "Libshaderc_combined", "lcms2", "Libplacebo", "Libdovi", "Libunibreak",
                "Libsmbclient", "gmp", "nettle", "hogweed", "gnutls", "Libdav1d", "Libuavs3d"
            ],
            path: "Sources/_FFmpeg-GPL",
            linkerSettings: [
                .linkedFramework("AudioToolbox"),
                .linkedFramework("CoreVideo"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("CoreMedia"),
                .linkedFramework("Metal"),
                .linkedFramework("VideoToolbox"),
                .linkedLibrary("bz2"),
                .linkedLibrary("iconv"),
                .linkedLibrary("expat"),
                .linkedLibrary("resolv"),
                .linkedLibrary("xml2"),
                .linkedLibrary("z"),
                .linkedLibrary("c++"),
            ]
        ),

        .binaryTarget(
            name: "Libmpv-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libmpv-GPL.xcframework.zip",
            checksum: "f0a43a3f313c3c73b2d6f8743f556538322024efa000a3624d37dfcce2cf9c6f"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavcodec-GPL.xcframework.zip",
            checksum: "3c82d6833f60e1f9249fdca82baef5da8f30192e312908809236d7eeb845a18b"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavdevice-GPL.xcframework.zip",
            checksum: "5281309b01808cb987d1ba11ba5fd4762cc9b7fac470d1c74db8374ed733c2af"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavformat-GPL.xcframework.zip",
            checksum: "ce4298fa678fc152e20c59f3f404fa8827160d58616587d1863461ee0e25a0d0"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavfilter-GPL.xcframework.zip",
            checksum: "c34a8d63f44c3ea2693f211b4a3d0f6e124f80b2b7c4382a8bfdf0d627f89ed0"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavutil-GPL.xcframework.zip",
            checksum: "0292766500de3991687e2d595003b35eead417134fabe066173a9747b757cca3"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libswresample-GPL.xcframework.zip",
            checksum: "a1156d061f4b449febd21098875e352bf31cd7c2135aa173ff6208c871f4a59a"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libswscale-GPL.xcframework.zip",
            checksum: "41b08e06a8ea2a2a1f4fa95d39b8e148672ddff75c0dee585fac5609ad97943b"
        ),
        //AUTO_GENERATE_TARGETS_BEGIN//

        .binaryTarget(
            name: "Libcrypto",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libcrypto.xcframework.zip",
            checksum: "593283be2a90f7fd66f6e6ed331b2f099cf403e0926fe3b4ac09a7062b793965"
        ),
        .binaryTarget(
            name: "Libssl",
            url: "https://github.com/mpvkit/openssl-build/releases/download/3.3.5/Libssl.xcframework.zip",
            checksum: "ff5ffd43d015d7285fd37e4a3145b25cbd8d2842740bd629a711c299a20e226a"
        ),

        .binaryTarget(
            name: "gmp",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gmp.xcframework.zip",
            checksum: "ad33c7a08f4cdcb9924c8f0e6d9a054dad33d7794b97667bf8b6fb2b236ae585"
        ),

        .binaryTarget(
            name: "nettle",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/nettle.xcframework.zip",
            checksum: "0fdf3ebf8bd7b8bc8eee837cf27261cb4c52ae520b6576a2f468656aa1691e02"
        ),
        .binaryTarget(
            name: "hogweed",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/hogweed.xcframework.zip",
            checksum: "25727c9fa67287fa0a4f4722f88bb8be669b23cd7e837e2d00870eb8a25d3f27"
        ),

        .binaryTarget(
            name: "gnutls",
            url: "https://github.com/mpvkit/gnutls-build/releases/download/3.8.11/gnutls.xcframework.zip",
            checksum: "3dbec5809339189bf9679e218c6cff387ebf8fb72745927835afc2678f5c9f4d"
        ),

        .binaryTarget(
            name: "Libunibreak",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libunibreak.xcframework.zip",
            checksum: "940d9833cf4477d0a260d9f2b4066125bc0ff7bbc111ac3c90e774765b77a559"
        ),

        .binaryTarget(
            name: "Libfreetype",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libfreetype.xcframework.zip",
            checksum: "496ca62488530e14b1e4624d20ee2b237c0bd675cd70c19da578a5768302d02d"
        ),

        .binaryTarget(
            name: "Libfribidi",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libfribidi.xcframework.zip",
            checksum: "bc15e097b892f2f90424e4a27ba287070cc2f98a74a4da10e6d2481d15cf5ff9"
        ),

        .binaryTarget(
            name: "Libharfbuzz",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libharfbuzz.xcframework.zip",
            checksum: "aa8e0b9ca0387dac74e3e93c86e34d11982bb013b28022d0e6966a8427a35b2e"
        ),

        .binaryTarget(
            name: "Libass",
            url: "https://github.com/mpvkit/libass-build/releases/download/0.17.5/Libass.xcframework.zip",
            checksum: "3f4c576d2818ceb4544aa2a20e1f55846511c5e706fd19adc3ea9fd842270498"
        ),

        .binaryTarget(
            name: "Libsmbclient",
            url: "https://github.com/mpvkit/libsmbclient-build/releases/download/4.15.13-2512/Libsmbclient.xcframework.zip",
            checksum: "3a53375fab11bc888cc553664ea5dd902208d04f0cc21ec746302bf356246b6f"
        ),

        .binaryTarget(
            name: "Libbluray",
            url: "https://github.com/mpvkit/libbluray-build/releases/download/1.4.0/Libbluray.xcframework.zip",
            checksum: "bc037d34e2b0b5ab7f202fb371f5fb298136cc66fdf406c2172185d06f53f18d"
        ),

        .binaryTarget(
            name: "Libuavs3d",
            url: "https://github.com/mpvkit/libuavs3d-build/releases/download/1.2.1-fix/Libuavs3d.xcframework.zip",
            checksum: "bd5256081486d16c51c868d755bf70266c424b54c895269580de44ec6707f789"
        ),

        .binaryTarget(
            name: "Libdovi",
            url: "https://github.com/mpvkit/libdovi-build/releases/download/3.3.2/Libdovi.xcframework.zip",
            checksum: "e693e239808350868e79c5448ef9f02e2716bc822dd8632a41a368a1eae5ca7d"
        ),

        .binaryTarget(
            name: "MoltenVK",
            url: "https://github.com/mpvkit/moltenvk-build/releases/download/1.4.2/MoltenVK.xcframework.zip",
            checksum: "aee189c54ad7c62bf734a3dc51eb4cfad5685d1d63b0ec519ecd1b437c332418"
        ),

        .binaryTarget(
            name: "Libshaderc_combined",
            url: "https://github.com/mpvkit/libshaderc-build/releases/download/2025.5.0/Libshaderc_combined.xcframework.zip",
            checksum: "758047b615708575b580eb960a2d083f760a29dc462d6eaa360416c946ce433b"
        ),

        .binaryTarget(
            name: "lcms2",
            url: "https://github.com/mpvkit/lcms2-build/releases/download/2.17.0/lcms2.xcframework.zip",
            checksum: "dc0dce0606f6ab6841a8ec5a6bd4448e2f3ef00661a050460f806c9393dc6982"
        ),

        .binaryTarget(
            name: "Libplacebo",
            url: "https://github.com/mpvkit/libplacebo-build/releases/download/7.360.1/Libplacebo.xcframework.zip",
            checksum: "2fa3d54cb81f302d6f11c7b2f509af30944381c3b11ee9d35096eb4637a6e2dd"
        ),

        .binaryTarget(
            name: "Libdav1d",
            url: "https://github.com/mpvkit/libdav1d-build/releases/download/1.5.3/Libdav1d.xcframework.zip",
            checksum: "d1a32ae6a1f0193e9f05c44c9176844af7f6d2a58cb33843f6f1b8dfd9224083"
        ),

        .binaryTarget(
            name: "Libavcodec",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavcodec.xcframework.zip",
            checksum: "e59efcb5aead51d8787dac377744732a58b3163896991d38dfda4c07cdfb36aa"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavdevice.xcframework.zip",
            checksum: "518624c8d5545f871a9992d7a5e7862b2806e251c3243c6f930d2a32e7a12de6"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavformat.xcframework.zip",
            checksum: "dd5e2ceff41e250a096a24fcec23f0d7d14ff1322f0406c43925192137bce31f"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavfilter.xcframework.zip",
            checksum: "512e2682eaae780d127d39e0f1de30f0c7d5cbe9e61eec84e205d07067767fb4"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libavutil.xcframework.zip",
            checksum: "5b346f96be7fcbc1efd0970f95e277b3a6dbe30de6cc6f799b68f4584d17c308"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libswresample.xcframework.zip",
            checksum: "119d4125701535eee6505b5a77a37373daf7c974cb0a7a1812d4ab60531714fd"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libswscale.xcframework.zip",
            checksum: "456d2ccf638f20bc918abd29a2f1b3f3b0d32a78cbcd1170e82df5dbf2b4b917"
        ),

        .binaryTarget(
            name: "Libuchardet",
            url: "https://github.com/mpvkit/libuchardet-build/releases/download/0.0.8/Libuchardet.xcframework.zip",
            checksum: "ea4f548a230a755e059144657cc9e2ff563c1cdeae03974c38f8b6e1a40303fb"
        ),

        .binaryTarget(
            name: "Libluajit",
            url: "https://github.com/mpvkit/libluajit-build/releases/download/2.1.0-fix/Libluajit.xcframework.zip",
            checksum: "3a171ef1627fb88260893dc452f989bd93dd8510814771ba3aff7753470d3f3e"
        ),

        .binaryTarget(
            name: "Libmpv",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.8/Libmpv.xcframework.zip",
            checksum: "660e0d790577c490cce4f3e9776522318f7e77daa7abc6eb81edf6aea6a9f9c9"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
