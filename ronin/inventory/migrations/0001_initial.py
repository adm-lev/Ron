# Generated by Django 4.0.3 on 2022-04-08 09:52

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Account',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('login', models.CharField(help_text='Введите логин', max_length=100, verbose_name='Логин')),
                ('first_name', models.CharField(help_text='Введите имя', max_length=100, verbose_name='Имя')),
                ('last_name', models.CharField(help_text='Введите фамилию', max_length=100, verbose_name='Фамилия')),
                ('third_name', models.CharField(blank=True, help_text='Введите отчество', max_length=100, null=True, verbose_name='Отчество')),
                ('telephone', models.IntegerField(blank=True, help_text='Введите номер телефона', null=True, verbose_name='Номер телефона')),
                ('main_email', models.EmailField(help_text='Введите адрес почты', max_length=254, verbose_name='Электронная почта')),
                ('second_email', models.EmailField(blank=True, help_text='Введите второй адрес почты', max_length=254, null=True, verbose_name='Вторая электронная почта')),
                ('departament', models.CharField(blank=True, help_text='Введите название отдела', max_length=100, null=True, verbose_name='Название отдела')),
            ],
            options={
                'db_table': 'Accounts',
            },
        ),
        migrations.CreateModel(
            name='Workstation',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('hostname', models.CharField(help_text='Введите имя ПК', max_length=100, verbose_name='Имя ПК')),
                ('cpu', models.CharField(help_text='Введите модель процессора', max_length=100, verbose_name='Процессор')),
                ('ram', models.CharField(help_text='Введите модель памяти', max_length=100, verbose_name='ОЗУ')),
                ('motherboard', models.CharField(help_text='Введите модель платы', max_length=100, verbose_name='Материнская плата')),
                ('storage', models.CharField(help_text='Введите модель накопителя', max_length=100, verbose_name='Накопитель')),
                ('software', models.CharField(help_text='Добавьте программу', max_length=100, verbose_name='Программное обеспечение')),
                ('user', models.ForeignKey(help_text='Добавьте пользователя', null=True, on_delete=django.db.models.deletion.SET_NULL, to='inventory.account', verbose_name='Пользователь')),
            ],
            options={
                'db_table': 'Workstations',
            },
        ),
    ]
