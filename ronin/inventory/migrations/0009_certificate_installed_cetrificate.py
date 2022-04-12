# Generated by Django 4.0.3 on 2022-04-12 14:38

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('inventory', '0008_alter_workstation_cpu_alter_workstation_motherboard_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='Certificate',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('owner', models.CharField(help_text='Введите имя владельца', max_length=50, verbose_name='Владелец')),
                ('ver_center', models.CharField(help_text='Введите название удостоверяющего центра', max_length=50, verbose_name='Удостоверяющий центр')),
                ('release_date', models.DateField(help_text='Введите дату начала сертииката', verbose_name='Дата начала срока действия')),
                ('ending_date', models.DateField(help_text='Введите дату окончания', verbose_name='Дата окончания')),
                ('sign', models.CharField(blank=True, help_text='Введите отпечаток', max_length=100, null=True, verbose_name='Отпечаток сертификата')),
            ],
            options={
                'verbose_name': 'Сертификаты',
                'verbose_name_plural': 'Сертификаты',
                'db_table': 'Certificate',
            },
        ),
        migrations.AddField(
            model_name='installed',
            name='cetrificate',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.CASCADE, to='inventory.certificate'),
        ),
    ]