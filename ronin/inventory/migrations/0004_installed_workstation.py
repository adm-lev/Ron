# Generated by Django 4.0.3 on 2022-04-11 07:25

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inventory', '0003_alter_account_options_alter_installed_options_and_more'),
    ]

    operations = [
        migrations.AddField(
            model_name='installed',
            name='workstation',
            field=models.ForeignKey(default='', on_delete=django.db.models.deletion.PROTECT, to='inventory.workstation'),
            preserve_default=False,
        ),
    ]
