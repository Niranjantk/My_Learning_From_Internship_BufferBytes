class GetUserListModel {
    List<Post>? posts;
    int? total;
    int? skip;
    int? limit;

    GetUserListModel({
        this.posts,
        this.total,
        this.skip,
        this.limit,
    });

}

class Post {
    int? id;
    String? title;
    String? body;
    List<String>? tags;
    Reactions? reactions;
    int? views;
    int? userId;

    Post({
        this.id,
        this.title,
        this.body,
        this.tags,
        this.reactions,
        this.views,
        this.userId,
    });

}

class Reactions {
    int? likes;
    int? dislikes;

    Reactions({
        this.likes,
        this.dislikes,
    });

}
