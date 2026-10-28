Projeto feito no Bootcamp da Digital Innovation One - ITAU JAVA COM IA <br/>
***essa versão do projeto foi adaptada pois a integração com OPENAI requer créditos, então estou usando a alternativa GROQ,
que possui modelos da openai com um plano gratuito limitado <br/>
***para bom funcionamento do projeto os áudios e textos devem ser em inglês já que a API da GROQ não suporta portguês

## Deploy no Render sem serviço de banco externo

O arquivo `render.yaml` configura o deploy usando o Dockerfile existente e o H2 em memória. No Render, crie o serviço a partir do Blueprint e informe `OPENAI_API_KEY` com sua chave da Groq. Não é necessário criar um serviço MySQL/Postgres.

O H2 mantém a compatibilidade com o código atual que usa JPA, mas é apenas temporário: os lançamentos/transações são apagados quando a instância reinicia ou é redeployada. Para persistência entre reinicializações, será necessário usar um banco externo ou alterar a implementação de armazenamento.


projeto adaptado para ficar sem banco de dados,
será implementado em um site, onde o usuário podera mandar um audio para transcrever ou escrever um texto para gerar um audio
https://simoesmatheus02.github.io/ <- implementação
