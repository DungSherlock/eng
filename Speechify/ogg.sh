#/bin/bash
# Đặt đường dẫn thư mục vào biến
script_dir=$(dirname "$(readlink -f "$0")")

# Lấy danh sách tên các tệp có định dạng .mp3 trong thư mục
file_names=("$script_dir"/*.mp3)

# Khởi tạo một mảng để lưu các giá trị tên tệp sau khi tách phần cuối cùng bằng dấu "-"
unique_values=()

# Lặp qua từng tên tệp
for file_name in "${file_names[@]}"; do
    # Tách phần cuối cùng của chuỗi bằng dấu "-"
    base_name=$(basename "$file_name")
    unique_value=${base_name%-*.mp3}
    
    # Thêm giá trị duy nhất vào mảng nếu chưa tồn tại
    if [[ ! " ${unique_values[@]} " =~ " ${unique_value} " ]]; then
        unique_values+=("$unique_value")
    fi
done

# In ra mảng unique_values (các giá trị duy nhất)
echo "Các giá trị duy nhất:"
printf '%s\n' "${unique_values[@]}"

for name in "${unique_values[@]}"; do
    # mp3cat ${name}*.mp3 -o m${name}.mp3 && zip ${name}.zip ${name}* && rm ${name}*.mp3
    # ffmpeg -loglevel error -f concat -safe 0 -i <(for f in ${name}*.mp3; do echo "file '$PWD/$f'"; done) -c:a libvorbis ${name}.ogg && rm ${name}*.mp3

    ffmpeg -loglevel error -f concat -safe 0 -i <(for f in ${name}*.mp3; do echo "file '$PWD/$f'"; done) -c:a libvorbis ${name}.ogg && zip ${name}.zip ${name}*.mp3 && rm ${name}*.mp3
done