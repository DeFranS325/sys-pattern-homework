# Домашнее задание к занятию "Что такое DevOps. СI/СD" - Сергеев Алексей


### Инструкция по выполнению домашнего задания

   1. Сделайте `fork` данного репозитория к себе в Github и переименуйте его по названию или номеру занятия, например, https://github.com/имя-вашего-репозитория/git-hw или  https://github.com/имя-вашего-репозитория/7-1-ansible-hw).
   2. Выполните клонирование данного репозитория к себе на ПК с помощью команды `git clone`.
   3. Выполните домашнее задание и заполните у себя локально этот файл README.md:
      - впишите вверху название занятия и вашу фамилию и имя
      - в каждом задании добавьте решение в требуемом виде (текст/код/скриншоты/ссылка)
      - для корректного добавления скриншотов воспользуйтесь [инструкцией "Как вставить скриншот в шаблон с решением](https://github.com/netology-code/sys-pattern-homework/blob/main/screen-instruction.md)
      - при оформлении используйте возможности языка разметки md (коротко об этом можно посмотреть в [инструкции  по MarkDown](https://github.com/netology-code/sys-pattern-homework/blob/main/md-instruction.md))
   4. После завершения работы над домашним заданием сделайте коммит (`git commit -m "comment"`) и отправьте его на Github (`git push origin`);
   5. Для проверки домашнего задания преподавателем в личном кабинете прикрепите и отправьте ссылку на решение в виде md-файла в вашем Github.
   6. Любые вопросы по выполнению заданий спрашивайте в чате учебной группы и/или в разделе “Вопросы по заданию” в личном кабинете.
   
Желаем успехов в выполнении домашнего задания!
   
### Дополнительные материалы, которые могут быть полезны для выполнения задания

1. [Руководство по оформлению Markdown файлов](https://gist.github.com/Jekins/2bf2d0638163f1294637#Code)

---

### Задание 1

**Что нужно сделать:**

1. Установите себе jenkins по инструкции из лекции или любым другим способом из официальной документации. Использовать Docker в этом задании нежелательно.
2. Установите на машину с jenkins [golang](https://golang.org/doc/install).
3. Используя свой аккаунт на GitHub, сделайте себе форк [репозитория](https://github.com/netology-code/sdvps-materials.git). В этом же репозитории находится [дополнительный материал для выполнения ДЗ](https://github.com/netology-code/sdvps-materials/blob/main/CICD/8.2-hw.md).
3. Создайте в jenkins Freestyle Project, подключите получившийся репозиторий к нему и произведите запуск тестов и сборку проекта ```go test .``` и  ```docker build .```.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Ответ 1

![Настройки проекта](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/1-1.png)
![Настройки проекта](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/1-2.png)
![Настройки проекта](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/1-3.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/1-4.png)

---

### Задание 2

**Что нужно сделать:**

1. Создайте новый проект pipeline.
2. Перепишите сборку из задания 1 на declarative в виде кода.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Ответ 2

![Настройки проекта](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/2-1.png)
![Настройки проекта](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/2-2.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/2-3.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/2-4.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/2-5.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/2-6png)

---

### Задание 3

**Что нужно сделать:**

1. Установите на машину Nexus.
1. Создайте raw-hosted репозиторий.
1. Измените pipeline так, чтобы вместо Docker-образа собирался бинарный go-файл. Команду можно скопировать из Dockerfile.
1. Загрузите файл в репозиторий с помощью jenkins.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Ответ 3

![Настройки проекта](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/3-4.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/3-1.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/3-2.png)
![Nexus](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/3-3.png)

---

### Задание 4*

Придумайте способ версионировать приложение, чтобы каждый следующий запуск сборки присваивал имени файла новую версию. Таким образом, в репозитории Nexus будет храниться история релизов.

Подсказка: используйте переменную BUILD_NUMBER.

В качестве ответа пришлите скриншоты с настройками проекта и результатами выполнения сборки.

### Ответ 4

![Настройки проекта](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/4-1.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/4-2.png)
![Вывод консоли](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/4-3.png)
![Nexus](https://github.com/DeFranS325/sys-pattern-homework/blob/8-02/img/4-4.png)