workspace "Technology Radar" "Description" {

    !identifiers hierarchical

    model {
        contributor = person "Contributor"
        reader = person "Reader"
        
        radarSystem = softwareSystem "Technology Radar" {
            source = container "Radar source" {
                contributor -> this "pull request with changes"
            }
            
            server = container "Web server" {
                source -> this "CI renders a static page and uploads it to"
                reader -> this "browses"
            }
        }
    }

    views {
        systemContext radarSystem "Diagram1" {
            include *
        }

        container radarSystem "Diagram2" {
            include *
        }

        styles {
            element "Element" {
                color #0773af
                stroke #0773af
                strokeWidth 7
                shape roundedbox
            }
            element "Person" {
                shape person
            }
            element "Database" {
                shape cylinder
            }
            element "Boundary" {
                strokeWidth 5
            }
            relationship "Relationship" {
                thickness 4
            }
        }
    }
}

