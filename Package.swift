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
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libmpv-GPL.xcframework.zip",
            checksum: "00d68b13f991d9d67c42d2c68057f102fba231779755c5754b9896e81bed8172"
        ),
        .binaryTarget(
            name: "Libavcodec-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavcodec-GPL.xcframework.zip",
            checksum: "d05bcbc55ce265b6d44ea1985bc176833e9b2bcb7798318f558abc2d1bd8b32a"
        ),
        .binaryTarget(
            name: "Libavdevice-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavdevice-GPL.xcframework.zip",
            checksum: "8fe43999bc14a9051339641f6fe0bae941e5f1661d45b9c3f168fa7a788d3d50"
        ),
        .binaryTarget(
            name: "Libavformat-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavformat-GPL.xcframework.zip",
            checksum: "108117147fcfaaa61a5ce1ea72180380527c0c86a8ebc997215e6bca78bb9271"
        ),
        .binaryTarget(
            name: "Libavfilter-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavfilter-GPL.xcframework.zip",
            checksum: "b65204e6cae1395654f14fcc7ce7beec5608a39a4dc44ea83b9135034d595153"
        ),
        .binaryTarget(
            name: "Libavutil-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavutil-GPL.xcframework.zip",
            checksum: "793d8a11aa05d9652150af8daf881f418fb603cbbd0403eb022f456145012815"
        ),
        .binaryTarget(
            name: "Libswresample-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libswresample-GPL.xcframework.zip",
            checksum: "f917a33c4abe1cda62f920c794414fb6c6231b5c07f33249b0bd761557d83d9c"
        ),
        .binaryTarget(
            name: "Libswscale-GPL",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libswscale-GPL.xcframework.zip",
            checksum: "1e8ddbe61ffe83fd2ff9cf5c388babac408e69e94bbdf24ad56650c5996b34af"
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
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavcodec.xcframework.zip",
            checksum: "6109efdc70d960e423219a1a6bd60783a2732fa1e2b9fad6b5816cec9368e9c7"
        ),
        .binaryTarget(
            name: "Libavdevice",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavdevice.xcframework.zip",
            checksum: "e7e3c0fc854bcdba6aa4516f9e3d78a4ace689d8345a402d645ee12db67724e6"
        ),
        .binaryTarget(
            name: "Libavformat",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavformat.xcframework.zip",
            checksum: "cae50464e42dc817083c0bab455468cbc82edaca8ef566c1df25e8bb87715be1"
        ),
        .binaryTarget(
            name: "Libavfilter",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavfilter.xcframework.zip",
            checksum: "64b16727f74c66f694219c5119d2b530ea1227bab4a039747a21c3aa3bdf607d"
        ),
        .binaryTarget(
            name: "Libavutil",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libavutil.xcframework.zip",
            checksum: "252849dbdec065f27c155d65ded73313532116d5766fec051b1cfa95252eab2e"
        ),
        .binaryTarget(
            name: "Libswresample",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libswresample.xcframework.zip",
            checksum: "13d47a5f12508c03f3e3dee9592046daa785fe69ed5e8417ffbc636c3eda8730"
        ),
        .binaryTarget(
            name: "Libswscale",
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.11/Libswscale.xcframework.zip",
            checksum: "8e715ae77b01a86cf6336bc70a540f7b9a907017279efd6b6c54bbf29054e2ad"
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
            url: "https://github.com/bandoracer/MPVKit/releases/download/1.0.0-marquee.12/Libmpv.xcframework.zip",
            checksum: "bebdce2f44a74a2a8ac190cfa1b0cdaf95bbb62127d1cc5b1453467ecb3feb32"
        ),
        //AUTO_GENERATE_TARGETS_END//
    ]
)
