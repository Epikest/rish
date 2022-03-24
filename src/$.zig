const std = @import("std");
const string = []const u8;

const shell = "bash"; // zsh, fish, etc.

pub fn main() !void {
    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    defer _ = gpa.deinit();
    var allocator = gpa.allocator();

    var iterator = try std.process.argsWithAllocator(allocator);
    defer iterator.deinit();

    _ = iterator.skip(); // Skip the program name
    var command: []const u8 = "";
    var arena = std.heap.ArenaAllocator.init(allocator);
    defer arena.deinit();
    var loopAllocator = arena.allocator();
    while (iterator.next()) |next| {
        var t = std.mem.concat(loopAllocator, u8, &.{ command, " ", next }) catch {
            std.log.err("Failed to allocate the string", .{});
            return;
        };
        command = loopAllocator.dupe(u8, t) catch {
            std.log.err("Failed to copy the string", .{});
            return;
        };
    }
    command = std.mem.concat(loopAllocator, u8, &.{ command }) catch {
        std.log.err("Failed to allocate the string", .{});
        return;
    };
    var process = std.ChildProcess.init(&.{ "wsl", "-e", shell, "-li", "-c", command }, allocator) catch {
        std.log.err("Failed to start child process", .{});
        return;
    };
    defer process.deinit();
    _ = process.spawnAndWait() catch {
        std.log.err("Failed to spawn the child process", .{});
        return;
    };
}