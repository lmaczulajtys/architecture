workspace "Dependency Track" "Dependency Track with Trivy Server" {

    !identifiers hierarchical

    model {
        developer = person "Developer"
        
        sourceControlSystem = softwareSystem "Source Control" {
            appRepository = container "Application repository"
        }

        packageRepositoriesSystem = softwareSystem "Package Repositories" {
            tag "External"
        }
        
        dependencyTrackSystem = softwareSystem "Dependency Track" {

            frontend = container "Frontend"

            apiServer = container "API server"

            database = container "Database" {
                tag "Database"
            }
            
            trivyServer = container "Trivy Server"

            frontend -> apiServer "API calls"
            apiServer -> database "Store data"
            apiServer -> trivyServer "Analyze components for vulnerabilities"
            apiServer -> packageRepositoriesSystem "Fetch packages metadata"
        }
        
        developer -> sourceControlSystem.appRepository "Release new version"
        sourceControlSystem.appRepository -> dependencyTrackSystem.apiServer "Upload SBOM"
        developer -> dependencyTrackSystem.frontend "Browse vulnerabilities"
    }

    views {
        systemContext dependencyTrackSystem "CystemContext" {
            include *
        }

        container dependencyTrackSystem "Container" {
            include *
            include sourceControlSystem.appRepository
        }

        styles {
            element "Element" {
                color #0773af
                stroke #0773af
                strokeWidth 7
                shape roundedbox
            }
            element "External" {
                color #5f646a
                stroke #5f646a
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

