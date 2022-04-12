from django.db import models
from django.urls import reverse

# Create your models here.


class Account(models.Model):

    class Meta:
        db_table = 'Accounts'
        verbose_name = 'Учетные записи'
        verbose_name_plural = 'Учетные записи'

    login = models.CharField(max_length=100, help_text='Введите логин', verbose_name='Логин')
    first_name = models.CharField(max_length=100, help_text="Введите имя", verbose_name="Имя")
    last_name = models.CharField(max_length=100, help_text="Введите фамилию", verbose_name="Фамилия",)
    third_name = models.CharField(max_length=100, help_text="Введите отчество",
                                  verbose_name="Отчество", null=True, blank=True)
    telephone = models.IntegerField(help_text="Введите номер телефона",
                                    verbose_name="Номер телефона", null=True, blank=True)
    main_email = models.EmailField(help_text="Введите адрес почты",
                                   verbose_name="Электронная почта")
    second_email = models.EmailField(help_text="Введите второй адрес почты",
                                     verbose_name="Вторая электронная почта", null=True, blank=True)
    departament = models.CharField(max_length=100, help_text="Введите название отдела",
                                   verbose_name="Название отдела", null=True, blank=True)

    def __str__(self):
        return self.login


class Software(models.Model):

    class Meta:
        db_table = 'Software'
        verbose_name = 'Программное обеспечение'
        verbose_name_plural = 'Программное обеспечение'

    name = models.CharField(max_length=100, help_text="Введите название ПО", verbose_name="Название")
    version = models.CharField(max_length=100, help_text="Введите версию", verbose_name="Версия")
    free = models.BooleanField(help_text="Укажите бесплатное ли ПО",verbose_name="Бесплатное ПО", default=True)
    soft_info = models.TextField(max_length=1000, help_text="Заполните информацию о продукте",
                                 verbose_name="О продукте")

    def __str__(self):
        return '%s %s' % (self.name, self.version)


class Workstation(models.Model):

    class Meta:
        db_table = 'Workstations'
        verbose_name = 'Рабочие станции'
        verbose_name_plural = 'Рабочие станции'

    hostname = models.CharField(max_length=100, help_text="Введите имя ПК", verbose_name="Имя ПК")
    cpu = models.CharField(max_length=100, help_text="Введите модель процессора", verbose_name="Процессор")
    ram = models.CharField(max_length=100, help_text="Введите модель памяти", verbose_name="ОЗУ")
    motherboard = models.CharField(max_length=100, help_text="Введите модель платы",
                                   verbose_name="Материнская плата")
    storage = models.CharField(max_length=100, help_text="Введите модель накопителя", verbose_name="Накопитель")
    # software = models.ManyToManyField('Software', help_text="Добавьте программу",
    #                                   verbose_name="Программное обеспечение")
    # software = models.ForeignKey('Software', on_delete=models.PROTECT, null=True, blank=True)
    user = models.ForeignKey('Account',  on_delete=models.PROTECT, help_text="Добавьте пользователя",
                             verbose_name="Пользователь", blank=True)

    def __str__(self):
        return self.hostname


class Installed(models.Model):

    class Meta:
        db_table = 'Installed'
        verbose_name = 'Установленное ПО'
        verbose_name_plural = 'Установленное ПО'

    software = models.ForeignKey('Software', on_delete=models.PROTECT,)
    workstation = models.ForeignKey('Workstation', on_delete=models.PROTECT,)
    license = models.CharField(max_length=100, help_text="Укажите условия лицензии", verbose_name="Лицензия")
    cert = models.BooleanField(help_text="Укажите нужен ли сертификат",
                               verbose_name="Нужен сертификат", default=False)
    cert_info = models.TextField(max_length=1000, help_text="Укажите данные о сертификате ЭП",
                                 verbose_name="Сертификат ЭП")

    def __str__(self):
        return '%s %s' % (self.software, self.workstation)

