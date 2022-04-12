from django.contrib import admin
from .models import Account, Workstation, Software, Installed, Certificate

# Register your models here.


class InstalledInline(admin.TabularInline):
    model = Installed


class WorkstationInline(admin.TabularInline):
    model = Workstation


admin.site.register(Account)
# admin.site.register(Workstation)
# admin.site.register(Software)
# admin.site.register(Installed)


@admin.register(Certificate)
class CertificateAdmin(admin.ModelAdmin):
    list_display = ('owner', 'release_date', 'ending_date')


@admin.register(Workstation)
class WorkstationAdmin(admin.ModelAdmin):
    list_display = ('hostname', 'user')
    inlines = [InstalledInline]


@admin.register(Installed)
class InstalledAdmin(admin.ModelAdmin):
    list_filter = ('software', 'workstation')
    # fieldsets = (
    #     ('Book one', {
    #         'fields': ('book', 'imprint', 'inv_nom')
    #     }),
    #     ('Status and ends term', {
    #         'fields': ('status', 'due_back')
    #     }))


@admin.register(Software)
class SoftwareAdmin(admin.ModelAdmin):
    list_display = ('name', 'version')
    # list_filter = ('genre', 'author')
    inlines = [InstalledInline]
