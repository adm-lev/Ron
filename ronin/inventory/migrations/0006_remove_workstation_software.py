# Generated by Django 4.0.3 on 2022-04-11 08:43

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('inventory', '0005_remove_workstation_software_workstation_software'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='workstation',
            name='software',
        ),
    ]
