require "./models/album.rb"

if Album.count == 0
    Album.create([
        {url: "test1", title: "test1", text: "test1", score: 0, category_id: 1},
        {url: "test2", title: "test2", text: "test2", score: 10, category_id: 1},
        {url: "test3", title: "test3", text: "test3", score: 20, category_id: 1},
        {url: "test4", title: "test4", text: "test4", score: 30, category_id: 2},
        {url: "test5", title: "test5", text: "test5", score: 40, category_id: 2},
        {url: "test6", title: "test6", text: "test6", score: 50, category_id: 2},
        {url: "test7", title: "test7", text: "test7", score: 60, category_id: 3},
        {url: "test8", title: "test8", text: "test8", score: 70, category_id: 3},
        {url: "test9", title: "test9", text: "test9", score: 80, category_id: 3},
        {url: "test10", title: "test10", text: "test10", score: 90, category_id: 3}
    ])
end

if Category.count == 0
    Category.create([
        {name: "たまごっち"},
        {name: "スマートフォン"},
        {name: "ガラケー"}
    ])
end