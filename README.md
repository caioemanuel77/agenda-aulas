# Mural de aulas

Site colaborativo pra registrar em que conteúdo parou a última aula de cada cadeira.

## 1. Criar o projeto no Supabase

1. Crie uma conta em https://supabase.com e um novo projeto (grátis).
2. Vá em **SQL Editor** > **New query**, cole o conteúdo de `schema.sql` e rode.
3. Vá em **Project Settings > API** e copie:
   - **Project URL**
   - **anon public key**

## 2. Rodar localmente

```bash
npm install
cp .env.example .env
```

Edite o `.env` com a URL e a chave anon que você copiou. Depois:

```bash
npm run dev
```

Abre em `http://localhost:5173`.

## 3. Hospedar no Vercel (grátis)

1. Suba esse projeto pra um repositório no GitHub.
2. Em https://vercel.com, clique em **Add New > Project** e importe o repositório.
3. O Vercel detecta que é um projeto Vite automaticamente.
4. Em **Environment Variables**, adicione:
   - `VITE_SUPABASE_URL`
   - `VITE_SUPABASE_ANON_KEY`
5. Clique em **Deploy**.

Pronto: você recebe um link tipo `mural-de-aulas.vercel.app` pra compartilhar com a turma.

## Sobre o limite de 5 cadeiras

O formulário de cadastro de cadeira bloqueia depois de 5. Pra mudar isso, edite `MAX_SUBJECTS` em `src/App.jsx`.

## Sobre segurança

As tabelas estão com leitura e escrita liberadas pra qualquer pessoa com o link (sem login), o que é razoável pra um grupo pequeno de colegas. Se no futuro quiser exigir login antes de cadastrar algo, dá pra usar o Supabase Auth e trocar as policies do `schema.sql`.
