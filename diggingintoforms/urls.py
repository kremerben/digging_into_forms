from django.conf.urls import patterns, include, url

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
    # Examples:
    # url(r'^$', 'diggingintoforms.views.home', name='home'),
    # url(r'^blog/', include('blog.urls')),

    url(r'^admin/', include(admin.site.urls)),
    url(r'^$', 'blog.views.my_form_view', name='my_form_view'),

    url(r'^author/$', 'blog.views.authors', name='authors'),
    url(r'^author/new/$', 'blog.views.new_author', name='new_author'),
    # url(r'^author/(?P<author_id>\w+)/$', 'blog.views.view_author', name='view_author'),
    # url(r'^author/(?P<author_id>\w+)/edit/$', 'blog.views.edit_author', name='edit_author'),
    # url(r'^author/(?P<author_id>\w+)/delete/$', 'blog.views.delete_author', name='delete_author'),


    url(r'^comment/$', 'blog.views.comments', name='comments'),
    url(r'^comment/new/$', 'blog.views.new_comment', name='new_comment'),
    # url(r'^comment/(?P<comment_id>\w+)/$', 'blog.views.view_comment', name='view_comment'),
    # url(r'^comment/(?P<comment_id>\w+)/edit/$', 'blog.views.edit_comment', name='edit_comment'),
    # url(r'^comment/(?P<comment_id>\w+)/delete/$', 'blog.views.delete_comment', name='delete_comment'),

)
