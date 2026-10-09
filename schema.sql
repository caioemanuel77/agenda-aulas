-- Rode isso no SQL Editor do Supabase (Project > SQL Editor > New query)

create table if not exists cadeiras (
  id uuid primary key default gen_random_uuid(),
  nome text not null,
  professor text,
  created_at timestamptz default now()
);

create table if not exists aulas (
  id uuid primary key default gen_random_uuid(),
  cadeira_id uuid references cadeiras(id) on delete cascade,
  data date not null,
  conteudo text not null,
  autor text,
  created_at timestamptz default now()
);

-- Row Level Security: liberado pra leitura e escrita pública,
-- já que o link do site só vai ser compartilhado com a turma.
-- Se quiser mais controle depois, dá pra trocar por autenticação (Supabase Auth).
alter table cadeiras enable row level security;
alter table aulas enable row level security;

create policy "leitura publica cadeiras" on cadeiras
  for select using (true);
create policy "insercao publica cadeiras" on cadeiras
  for insert with check (true);

create policy "leitura publica aulas" on aulas
  for select using (true);
create policy "insercao publica aulas" on aulas
  for insert with check (true);

-- Habilita realtime (pra ver conteúdo novo aparecer sem dar refresh)
alter publication supabase_realtime add table cadeiras;
alter publication supabase_realtime add table aulas;
