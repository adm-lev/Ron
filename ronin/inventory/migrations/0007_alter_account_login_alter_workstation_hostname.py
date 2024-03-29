# Generated by Django 4.0.3 on 2022-04-12 12:15

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('inventory', '0006_remove_workstation_software'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='login',
            field=models.CharField(help_text='Введите логин', max_length=100, unique=True, verbose_name='Логин'),
        ),
        migrations.AlterField(
            model_name='workstation',
            name='hostname',
            field=models.CharField(help_text='Введите имя ПК', max_length=100, unique=True, verbose_name='Имя ПК'),
        ),
    ]
