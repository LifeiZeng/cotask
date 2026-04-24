# cotask
simple-fast coroutine

1.  介绍

    一个轻量级、高性能的C语言协程库，目前支持amd64和arm64架构。

2.  性能（单核）

    | CPU             | System  | Context Switches/sec​ |
    | --------------- | ------- | -------------------- |
    | intel i7-8750H  | macos   |   3.5 亿次 / 秒       |
    | apple m5 pro    | macos   |   7.5 亿次 / 秒       |
    | intel i5-9600K  | windows |   2.8 亿次 / 秒       |
    | intel i5-9600K  | linux   |   4.1 亿次 / 秒       |
    | intel i5-12400  | windows |   4.7 亿次 / 秒       |

3.  许可协议

    MIT License - 完全免费用于商业和个人项目