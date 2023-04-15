require "csv" # CSVファイルを扱うためのライブラリを読み込んでいます

puts "1 → 新規でメモを作成する / 2 → 既存のメモを編集する"

memo_type = gets.to_i # ユーザーの入力値を取得し、数字へ変換しています

if memo_type == 1
  
  p "拡張子を除いたファイル名を入力してください"
  
  file_name = gets.chomp.to_s
  
  #同名のファイルが既に存在している場合
  if File.exist?("#{file_name}.csv")
    
    puts "同名のファイルが既に存在します"
    
  else
    
    p "メモしたい内容を記入してください"
    p "完了したらCtrl + D をおします"
    
    text = STDIN.read
    
    #テキスト変数の中身を上書きする
    CSV.open("#{file_name}.csv","w") do |csv|
      csv << ["#{text}"]        
    end
  end
  
elsif memo_type == 2
  
  p "拡張子を除いたファイル名を入力してください"
  
  file_name = gets.chomp.to_i
  
  #該当するファイルが存在する場合
  if File.exist?("#{file_name}.csv")

    p "メモしたい内容を記入してください"
    p "完了したらCtrl + D をおします"    
    
    text = STDIN.read
  
    #テキスト変数の中身を上書きする
    CSV.open("#{file_name}.csv","w") do |csv|
      csv << ["#{text}"]        
    end
  
  #該当するファイルが存在しない場合
  else
    puts "ファイルが存在しません"
    
  end

#最初の選択で1または2以外が選択された場合
else 
  puts "1か2を選択してください"
  
end

