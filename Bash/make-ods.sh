#!/bin/bash  -xue

script_dir=$(readlink -f "$(dirname "$0")")
work_root_dir=${TMPDIR:-'/tmp/GenerateOds'}

# 引数チェック
if [[ $# -lt 2 ]] ; then
    echo "Usage: $0 (Output .ods File) (Input CSVs...)" 1>&2
    exit 2
fi

output_ods_name=$1
shift 1

mkdir -p "${work_root_dir}"
work_dir=$(mktemp -d "${work_root_dir}/genods.XXXXXX")

# テンプレートをコピーする
pushd "${script_dir}/../Templates"
cp -pRv META-INF/ content.*.xml styles.xml "${work_dir}/"
pushd

# 指定されたファイルから content.body.xml を生成する

rm -f "${work_dir}/content.body.xml"

for file in "$@" ; do
    name=${file%%*/}    # ディレクトリ名を除去
    cat "${file}"   \
        | gawk -F ',' -f "${script_dir}/convert.awk" -v tablename=${name} \
        | tee -a content.body.xml
done

pushd "${work_dir}"
ls
cat content.header.xml content.body.xml content.footer.xml > content.xml
zip "Temp.ods"  META-INF/ styles.xml content.xml
popd

# 作業ディレクトリに作成した .ods ファイルを
# 指定された場所に指定された名前でコピーする

cp -pv "${work_dir}/Temp.ods" "${output_ods_name}"
