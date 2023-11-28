module AtividadesHelper
    def formatar_modalidade(n)
        modalidade = ["Projetos e Programas","Cursos e Eventos","Prestação de Serviços","Disciplinas Extensionista"]
        modalidade[n-1]
    end
    
    def formatar_tipo(t)
        hash_dados = {
            "colaboracao" => "Participação em projetos de extensão ligados à matriz curricular.",
            "contribuicao" => "Contribuição em projetos isolados cadastrados na PROEX.",
            "coordenacao" => "Organização de eventos educacionais presenciais e remotos.",
            "divulgacao" => "Engajamento em atividades de popularização científica.",
            "participacao" => "Colaboração em comissões de campanhas sociais e programas comunitários.",
            "organizacao" => "Participação em Comissão organizadora de Campanhas ou programas sociais.",
            "formacao" => "Capacitação de professores da rede pública.",
            "auxilio" => "Apoio em aulas de reforço escolar supervisionadas.",
            "orientacao" => "Assessoria e consultoria para públicos-alvo específicos.",
            "interatividade" => "Atendimento ao público em espaços culturais e científicos.",
            "criacao" => "Contribuição na produção de conteúdo sociocultural e científico-tecnológico."
        }
        hash_dados[t] == nil ? t : hash_dados[t]
    end
    def formatar_hora(t)
        hash_dados = {
            "colaboracao" => "/semestre",
            "contribuicao" => "/projeto",
            "coordenacao" => "/curso",
            "divulgacao" => "/dia de evento",
            "participacao" => "/dia de evento",
            "organizacao" => "/dia de evento",
            "formacao" => "/aula",
            "auxilio" => "/aula",
            "orientacao" => "/atividade",
            "interatividade" => "/atividade",
            "criacao" => "/edição"
        }
        hash_dados[t] unless hash_dados[t] == nil
    end
end