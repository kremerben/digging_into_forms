# -*- coding: utf-8 -*-
from south.utils import datetime_utils as datetime
from south.db import db
from south.v2 import SchemaMigration
from django.db import models


class Migration(SchemaMigration):

    def forwards(self, orm):
        # Deleting model 'User'
        db.delete_table(u'blog_user')

        # Removing M2M table for field vote on 'User'
        db.delete_table(db.shorten_name(u'blog_user_vote'))

        # Deleting field 'Comment.user'
        db.delete_column(u'blog_comment', 'user_id')

        # Adding field 'Comment.author'
        db.add_column(u'blog_comment', 'author',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=1, related_name='comment_authors', to=orm['blog.Author']),
                      keep_default=False)


    def backwards(self, orm):
        # Adding model 'User'
        db.create_table(u'blog_user', (
            ('username', self.gf('django.db.models.fields.CharField')(max_length=120)),
            ('name', self.gf('django.db.models.fields.CharField')(max_length=120)),
            (u'id', self.gf('django.db.models.fields.AutoField')(primary_key=True)),
            ('email', self.gf('django.db.models.fields.EmailField')(max_length=75)),
        ))
        db.send_create_signal(u'blog', ['User'])

        # Adding M2M table for field vote on 'User'
        m2m_table_name = db.shorten_name(u'blog_user_vote')
        db.create_table(m2m_table_name, (
            ('id', models.AutoField(verbose_name='ID', primary_key=True, auto_created=True)),
            ('user', models.ForeignKey(orm[u'blog.user'], null=False)),
            ('blogpost', models.ForeignKey(orm[u'blog.blogpost'], null=False))
        ))
        db.create_unique(m2m_table_name, ['user_id', 'blogpost_id'])

        # Adding field 'Comment.user'
        db.add_column(u'blog_comment', 'user',
                      self.gf('django.db.models.fields.related.ForeignKey')(default=1, related_name='comment_authors', to=orm['blog.User']),
                      keep_default=False)

        # Deleting field 'Comment.author'
        db.delete_column(u'blog_comment', 'author_id')


    models = {
        u'blog.author': {
            'Meta': {'object_name': 'Author'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '120'})
        },
        u'blog.blogpost': {
            'Meta': {'object_name': 'BlogPost'},
            'author': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'posts'", 'to': u"orm['blog.Author']"}),
            'body': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'pub_date': ('django.db.models.fields.DateTimeField', [], {}),
            'title': ('django.db.models.fields.CharField', [], {'max_length': '120'})
        },
        u'blog.comment': {
            'Meta': {'object_name': 'Comment'},
            'author': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'comment_authors'", 'to': u"orm['blog.Author']"}),
            'body': ('django.db.models.fields.TextField', [], {}),
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'post': ('django.db.models.fields.related.ForeignKey', [], {'related_name': "'comments'", 'to': u"orm['blog.BlogPost']"})
        },
        u'blog.tag': {
            'Meta': {'object_name': 'Tag'},
            u'id': ('django.db.models.fields.AutoField', [], {'primary_key': 'True'}),
            'name': ('django.db.models.fields.CharField', [], {'max_length': '20'}),
            'posts': ('django.db.models.fields.related.ManyToManyField', [], {'related_name': "'tags'", 'symmetrical': 'False', 'to': u"orm['blog.BlogPost']"})
        }
    }

    complete_apps = ['blog']