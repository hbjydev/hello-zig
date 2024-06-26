const std = @import("std");
const zap = @import("zap");

fn on_request(r: zap.Request) void {
    r.sendBody("hello, world") catch return;
}

pub fn main() !void {
    var listener = zap.HttpListener.init(.{
        .port = 3001,
        .on_request = on_request,
        .log = true,
    });
    try listener.listen();

    std.debug.print("Listening on 0.0.0.0:3000\n", .{});

    zap.start(.{
        .threads = 2,
        .workers = 2,
    });
}
