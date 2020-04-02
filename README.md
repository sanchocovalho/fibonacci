# Задание E6.9

   Веб-сервис, который возвращает числа Фибоначчи

   ТехЗадание:
Сервис должен по GET запросу с параметром k возвращать k-ое число Фибоначчи. Необходимо реализовать кеширование, то есть, если число уже было запрошено, результат должен браться из кеша, а не пересчитываться.
Кеширование необходимо реализовать с помощью memcached (или redis), фреймворк для веб-сервиса используйте на ваше усмотрение, однако для такого небольшого проекта брать Django скорее перебор.
Приложение должно запускаться в Docker. Код приложения должен быть выложен на github, вместе с файлами Dockerfile и docker-compose.yml. В репозитории в README.md вам нужно поместить инструкцию по запуску приложения.
Дополнительно можно задеплоить это приложение в облачный сервис, например, Яндекс.Облако или mail.ru cloud solutions.
Задание считается выполненным, если:
1) Прислана ссылка на репозиторий в github;
2) Репозиторий содержит код приложения на Python, у которого есть эндпоинт, который GET запросу c параметром k считает k-ое число Фибоначчи;
3) Рассчет k-ого числа Фибоначчи происходит только в случае, если ранее это число не запрашивалось, иначе значение берется из Redis или memcached;
4) Приложение на Python и Redis могут быть запущены в контейнерах, и репозиторий содержит словесные (README.md) и машинные (Dockerfile, docker-compose.yaml) инструкции по запуску задания;
5) Бонус: прислана ссылка этого приложения, развернутого в каком-либо облачном сервисе.

Для того, чтобы запустить локальный сервер необходимо:
1) Распакуйте архив с проектом в папку, например, C:\fibonacci.
2) Откройте командную строку и зайдите в директорию проекта:
   - cd C:\fibonacci
3) Выполните команды:
   - docker-compose build
   - docker-compose up (или docker-compose up -d --> остановить можно командами docker-compose stop или docker-compose down)
4) Сервер откроется по адресу  http://127.0.0.1 (на Windows может открыться по другому адресу, что оперделить его надо выполнить команду docker-machine ip default). Если адрес http://127.0.0.1 занят, то поменяйте порт в docker-compose.yaml, например, на 8000 и сервер откроется на http://127.0.0.1:8000

Данный проект находится на http://84.201.153.170
