from django import forms
from models import *
import re
from django.core.exceptions import ValidationError


class BaseForm(forms.Form):
    name = forms.CharField(max_length=120)


def comment_validator(value):
    if re.match("orange|.*z.*", value) is not None:
        raise ValidationError("You can't say orange or use the letter 'z'.")

class CommentForm(forms.Form):
    author = forms.ModelChoiceField(queryset=Author.objects.all())
    comment_body = forms.CharField(validators=[comment_validator])
    post = forms.ModelChoiceField(queryset=BlogPost.objects.all())
    importance = forms.IntegerField(max_value=10, min_value=1)

class AuthorForm(BaseForm):
    email = forms.EmailField(required=False)


class BlogPostForm(forms.Form):
    title = forms.CharField()
    body = forms.CharField()
    author = forms.ModelChoiceField(queryset=Author.objects.all())
    pub_date = forms.DateTimeField()


class TagForm(BaseForm):
    post = forms.ModelMultipleChoiceField(queryset=BlogPost.objects.all())
