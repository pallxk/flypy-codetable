#!/bin/sh

# 格式化码表文件，移除序号。
#
# 格式化前：
#     测试	ceui#序18322
# 格式化后：
#     测试	ceui

basedir=`dirname "$0"`

for path in "$basedir"/导出码表/*.txt; do
	filename=`basename "$path"`
	newPath="$basedir"/处理码表/"$filename"

	# 将文本转换为 UTF-8 编码
	iconv -f UTF-16LE -t UTF-8 "$path" > "$newPath"
	# 移除词条中的序号
	sed -i -r -e 's/#序.+$//' "$newPath"
done
