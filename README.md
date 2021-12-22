# CI-CD homework


1. Зарегистрироваться на https://hub.docker.com/ и обернуть логин и пароль в GtiLab CI/CD Variables (пароль с маскировкой)
2. Написать .gitlab-ci.yml со стадиями **build** и **test** на базе данного репозитория.  
2.1 Шаг сборки стандартный для докер образов. Версия сборки должна соответствовать v1.0."внутренный номер пайплайна".  
2.2 Для шага тестирования написать docker-compose.yaml с двумя сервисами: первый (app) - сам сервис по имеющемуся Dockerfile, второй (test) - чекер на базе образа curl с проверкой доступности рабочего порта app с предварительной задержкой в ~10 секунд. В скрипте шага тестирования можете воспользоваться примером:  
```
  script:
    - docker-compose 
        -p "$CI_PROJECT_NAME"_"$CI_PIPELINE_ID"
      up
        --abort-on-container-exit
        --exit-code-from app
        --quiet-pull
```  
2.3 Шаг build должен запускаться только для ветки develop. Шаг test должен запускаться только для веток, название которых начинается со слова "Release-" и эти ветки должны быть по-умолчанию protected.  
3. Оптимизировать конфигурацию CI/CD путём выноса исходников в отдельный репозиторий. Импортировать их в текущем репозитории и с помощью extends определить разные варианты шагов для stage и prod окружений.  
3.1 Для stage версии образов будут с дополнительным постфиксом "-stage".  
3.2 Для prod сборка должна запускаться мануально. Тесты должны запускаться автоматически, но строго после успешного завершения сборки. И сборка, и тесты для prod запускаются только при создании тега вида v1.0.*, такие теги должны быть по-умолчанию protected. Версия образа в данном случае должна соответствовать тегу.  

**Старайтесь максимально применять изученные операторы для оптимизации конфигов и удобной конфигурации**
