workspace "Obsidian Sync with GCS" "Description" {

    !identifiers hierarchical

    model {
        contributor = person "Contributor"
        reader = person "Reader"
        
        obsidianNotesSystem = softwareSystem "Obsidian Notes" {
            mobileClient = container "Mobile Client" {
                tags "Mobile"
            }

            desktopClient = container "Desktop Client" {
                tags "Desktop"
            }
            
            gcs = container "GCS Bucket" {
                tags "Google Cloud Platform - Cloud Storage"
                
                mobileClient -> this "Synchronize data" "S3"
                desktopClient -> this "Synchronize data" "S3"
            }
        }
    }

    views {
        container obsidianNotesSystem {
            include *
            autoLayout lr
        }

        styles {
            element "Element" {
                color #0773af
                stroke #0773af
                strokeWidth 7
                shape roundedbox
            }
            element "Desktop" {
                shape Window
            }
            element "Mobile" {
                shape MobileDevicePortrait
            }
            element "Google Cloud Platform - Cloud Storage" {
                shape folder
            }
            element "Boundary" {
                strokeWidth 5
            }
            relationship "Relationship" {
                thickness 4
            }
        }
        
        theme google-cloud-platform-2025.09
    }
}
