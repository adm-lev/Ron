from django.shortcuts import render
from django.http import HttpResponse
from .models import Account, Workstation, Software, Installed, Certificate
from django.views import generic

# Create your views here.


def index(request):

    # Генерация количеств главных объектов
    # Учетные записи
    num_accounts = Account.objects.all().count()
    # Рабочие станции
    num_workstations = Workstation.objects.all().count()
    # программы
    num_software = Software.objects.all().count()
    # Установленные программы
    num_installed = Installed.objects.all().count()
    # Сертификаты ЭП
    num_certificate = Certificate.objects.all().count()

    # Отрисовка html шаблона с данными index.html внутри переменной context
    return render(request, 'index.html',
                  context={
                      'num_accounts': num_accounts,
                      'num_workstations': num_workstations,
                      'num_software': num_software,
                      'num_installed': num_installed,
                      'num_certificate': num_certificate,
                  })


class AccountListView(generic.ListView):
    model = Account


class WorkstationListView(generic.ListView):
    model = Workstation


class SoftwareListView(generic.ListView):
    model = Software


class InstalledListView(generic.ListView):
    model = Installed


class CertificateListView(generic.ListView):
    model = Certificate


class CertificateDetailView(generic.DetailView):
    model = Certificate


class AccountDetailView(generic.DetailView):
    model = Account


class WorkstationDetailView(generic.DetailView):
    model = Workstation


class SoftwareDetailView(generic.DetailView):
    model = Software


class InstalledDetailView(generic.DetailView):
    model = Installed
