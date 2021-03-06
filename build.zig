const std = @import("std");

pub fn build(b: *std.build.Builder) void {
    // Standard target options allows the person running `zig build` to choose
    // what target to build for. Here we do not override the defaults, which
    // means any target is allowed, and the default is native. Other options
    // for restricting supported target set are available.
    const target = b.standardTargetOptions(.{});

    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    // TODO: Automatic naming based on target
    const exe_name = b.option([]const u8, "exe-name", "Override default executable name") orelse "$";
    const exe = b.addExecutable(exe_name, "src/rish.zig");
    exe.setTarget(target);
    exe.setBuildMode(mode);
    exe.install();

    const exe_options = b.addOptions();
    exe.addOptions("build_options", exe_options);

    const shell = b.option([]const u8, "shell", "Shell to use, must support interactive login") orelse "bash";
    exe_options.addOption([]const u8, "shell", shell);

    const run_cmd = exe.run();
    run_cmd.step.dependOn(b.getInstallStep());
    if (b.args) |args| {
        run_cmd.addArgs(args);
    }

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run_cmd.step);

    const exe_tests = b.addTest("src/$.zig");
    exe_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run unit tests");
    test_step.dependOn(&exe_tests.step);

    // TODO: Add release build step
    // const release_step = b.step("release", "Build release");
    // release_step.dependOn(&exe.step);
}
