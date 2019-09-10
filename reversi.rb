cnt = 60 #手順の数

#shape(8,8)の配列に対して周辺を9で囲む

h = 8
w = 8
hoge = 9 #盤面の周りを9で囲む.エラー防止用

arr = Array.new(h).map{Array.new(w,0)} #2次元配列の作成


#盤面の周りを9で囲む
arr.unshift( Array.new(h+2,hoge)) #上部に追加
arr.push( Array.new(h+2,hoge)) #下部に追加

for i in 1..h
    arr[i].insert(0,hoge) #左一列に追加
    arr[i].insert(h+1,hoge) #右一列に追加
end


#初期設定
# 1 = black
# 2 = white
arr[4][5] = 1
arr[5][4] = 1

arr[4][4] = 2
arr[5][5] = 2


for i in 0..h+1
    p arr[i]
end

p "-------------------------------------"

#置いた位置から周り8マスの状況をチェックする
def check(arr,x,y,bw)
    
    p "横#{x}、縦#{y}に#{bw}を置きました！！"
    
    if bw == 1
        enemy = 2
    else
        enemy = 1
    end
    
    arr[y][x] = bw
    
    #左のマスを調べる
    if arr[y][x-1] == enemy
        unless arr[y][x-1] == 9 #隣が9の場合は判定しない
            if arr[y][x-2] == bw
                arr[y][x-1] = bw # 黒に置き換える
            end
        end
    end   

    
    #右のマス
    if arr[y][x+1] == enemy
        unless arr[y][x+1] == 9 #隣が9の場合は判定しない
            if arr[y][x+2] == bw
                arr[y][x+1] = bw # 黒に置き換える
            end
        end
    end   
    
    #上のマス
    if arr[y-1][x] == enemy
        unless arr[y-1][x] == 9 #隣が9の場合は判定しない
            if arr[y-2][x] == bw
                arr[y-1][x] = bw # 黒に置き換える
            end
        end
     end 
     
    # 下のマス
    if arr[y+1][x] == enemy
        unless arr[y+1][x] == 9 #隣が9の場合は判定しない
            if arr[y+2][x] == bw
                arr[y+1][x] = bw # 黒に置き換える
            end
        end
    end   
    
    #左上
    if arr[y-1][x-1] == enemy
        unless arr[y-1][x-1] == 9 #隣が9の場合は判定しない
            if arr[y-2][x-2] == bw
                arr[y-1][x-1] = bw # 置き換える
            end
        end
    end
    
    #左下
    if arr[y+1][x-1] == enemy
        unless arr[y+1][x-1] == 9 #隣が9の場合は判定しない
            if arr[y+2][x-2] == bw
                arr[y+1][x-1] = bw # 置き換える
            end
        end
    end
    
    #右上
    if arr[y+1][x+1] == enemy
        unless arr[y+1][x+1] == 9 #隣が9の場合は判定しない
            if arr[y+2][x+2] == bw
                arr[y+1][x+1] = bw # 置き換える
            end
        end
    end
    
    #右下
    if arr[y-1][x+1] == enemy
        unless arr[y-1][x+1] == 9 #隣が9の場合は判定しない
            if arr[y-2][x+2] == bw
                arr[y-1][x+1] = bw # 置き換える
            end
        end
    end
    
    
    return arr
    
end

p "-------------------------------------"


black_cnt = 0
white_cnt = 0

#---------------------------------------

for i in 0..cnt-1

    input = gets.split(" ") # 石の色と座標を取得
    bw = input[0]
    x = input[1].to_i
    y = input[2].to_i
    
    if bw == "B"
        bw = 1
    else
        bw = 2
    end
    
    
    p i + 1
    arr = check(arr,x,y,bw)
    
    for i in 0..h+1
        p arr[i]
    end
end



for i in 0..h+1
    black_cnt += arr[i].count(1)
    white_cnt += arr[i].count(2)
end


p black_cnt
p white_cnt