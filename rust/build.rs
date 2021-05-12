fn main() -> Result<(), Box<dyn std::error::Error>> {

    let iface_files = &[
        "../proto/auth.proto",
        "../proto/post.proto",
        "../proto/command.proto",
    ];

    let dirs = &["../proto"];

    tonic_build::configure()
        .build_client(false)
        .build_server(true)
        .protoc_arg("--experimental_allow_proto3_optional")
        .compile(iface_files, dirs)?;

    for file in iface_files {
        println!("cargo:rerun-if-changed={}", file);
    }

    Ok(())
}
