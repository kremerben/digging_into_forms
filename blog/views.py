from django.shortcuts import render, render_to_response, redirect
from forms import *
from django.core.mail import send_mail

# Create your views here.


def my_form_view(request):
    data = {"comment_form": CommentForm()}
    return render(request, "my_form.html", data)


def authors(request):
    authors = Author.objects.all()
    return render_to_response("author/authors.html", {'authors': authors})


def tags(request):
    tags = Tag.objects.all()
    return render_to_response("tag/tags.html", {'tags': tags})


def comments(request):
    comments = Comment.objects.all()
    return render_to_response("comment/comments.html", {'comments': comments})

def blog_posts(request):
    blog_posts = BlogPost.objects.all()
    return render_to_response("blog_post/blog_posts.html", {'blog_posts': blog_posts})


def new_author(request):
    if request.method == "POST":
        form = AuthorForm(request.POST)
        if form.is_valid():
            name = form.cleaned_data['name']
            email = form.cleaned_data['email']
            Author.objects.create(name=name, email=email)
            send_mail('Author created', 'The message.\n{}\n{}'.format(name, email), email,
    ['ben@kremerdesign.com'], fail_silently=False)
            return redirect("/author")
    else:
        form = AuthorForm()
    data = {'form': form}
    return render(request, "author/new_author.html", data)

def new_comment(request):
    if request.method == "POST":
        form = CommentForm(request.POST)
        if form.is_valid():
            comment_body = form.cleaned_data['comment_body']
            author = form.cleaned_data['author']
            post = form.cleaned_data['post']
            importance = form.cleaned_data['importance']
            Comment.objects.create(comment_body=comment_body, author=author, post=post, importance=importance)

            return redirect("/comment")
    else:
        form = CommentForm()
    data = {'comment_form': form}
    return render(request, "comment/new_comment.html", data)

#
# def new_comment(request):
#     if request.method == "POST":
#         form = AuthorForm(request.POST)
#         if form.is_valid():
#             if form.save():
#                 return redirect("/authors")
#     else:
#         form = AuthorForm()
#     data = {'form': form}
#     return render(request, "author/new_author.html", data)
