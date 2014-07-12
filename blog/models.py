from django.db import models


#from blog.models import Post, Author, Tag, User, Comment


class Author(models.Model):
    name = models.CharField(max_length=120)
    # twitter = models.CharField(max_length=40, null=True)
    email = models.EmailField(null=True, blank=True)

    def __unicode__(self):
        return u"{}".format(self.name)


class BlogPost(models.Model):
    # one author to many posts
    # one post to many comments
    title = models.CharField(max_length=120)
    body = models.TextField()
    author = models.ForeignKey(Author, related_name='posts')
    pub_date = models.DateTimeField()
    # vote = models.ManyToManyField(User)

    def __unicode__(self):
        """
        allows for unicode characters in string
        """
        return u"{}".format(self.title)


class Tag(models.Model):
    #many tags to many posts
    name = models.CharField(max_length=20)
    posts = models.ManyToManyField(BlogPost, related_name='tags')

    def __unicode__(self):
        """
        allows for unicode characters in string
        """
        return u"{}".format(self.name)

#
# class User(models.Model):
#     # many users have many votes
#     name = models.CharField(max_length=120)
#     email = models.EmailField()
#     username = models.CharField(max_length=120)
#     vote = models.ManyToManyField(BlogPost, related_name='user_votes')
#
#     def __unicode__(self):
#         """
#         allows for unicode characters in string
#         """
#         return u"{}".format(self.name)
#

class Comment(models.Model):
    # many users has many comments
    # one post has many comments
    comment_body = models.TextField()
    importance = models.IntegerField(max_length=2 )
    author = models.ForeignKey(Author, related_name='comments')
    post = models.ForeignKey(BlogPost, related_name='comments', verbose_name='post_comment')

    def __unicode__(self):
        """
        allows for unicode characters in string
        """
        return u"{}".format(self.body)

