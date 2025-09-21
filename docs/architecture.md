# Knowledge Hub System Architecture

## Overview

Knowledge Hub is a RAG (Retrieval-Augmented Generation) AI chat application designed for enterprise knowledge management.

## System Flow Diagram

```mermaid
graph TB
    subgraph "User Roles"
        Admin[管理者 - Admin]
        Employee[従業員 - Employee]
    end

    subgraph "Application Layer"
        AdminController[Admin Controllers]
        EmployeeController[Employee Controllers]
        AuthSystem[Authentication System<br/>Devise]
    end

    subgraph "Service Layer"
        RagService[RAG Service]
        EmbeddingService[Embedding Service]
        VectorSearch[Vector Search Service]
        ChunkGenerator[Chunk Generator]
    end

    subgraph "Data Layer"
        PostgreSQL[(PostgreSQL Database)]
        VectorDB[(Vector Database<br/>pgvector)]
        KnowledgeChunks[Knowledge Chunks]
    end

    subgraph "External Services"
        LLM[LLM API<br/>ruby_llm]
    end

    %% User interactions
    Admin --> AdminController
    Employee --> EmployeeController
    
    %% Authentication
    AdminController --> AuthSystem
    EmployeeController --> AuthSystem
    
    %% Admin operations
    AdminController --> PostgreSQL
    
    %% Employee data operations
    EmployeeController --> PostgreSQL
    EmployeeController --> EmbeddingService
    
    %% Chat operations
    EmployeeController --> RagService
    
    %% Service interactions
    RagService --> VectorSearch
    RagService --> LLM
    EmbeddingService --> ChunkGenerator
    EmbeddingService --> LLM
    EmbeddingService --> KnowledgeChunks
    VectorSearch --> VectorDB
    
    %% Data storage
    KnowledgeChunks --> VectorDB
    PostgreSQL --> VectorDB
```

## Component Descriptions

### User Roles
- **Admin (管理者)**: Manages employee accounts and system administration
- **Employee (従業員)**: Manages enterprise data and interacts with RAG AI chat

### Application Layer
- **Admin Controllers**: Handle admin-specific operations
- **Employee Controllers**: Handle employee data management and chat operations
- **Authentication System**: Devise-based authentication and authorization

### Service Layer
- **RAG Service**: Core service that handles AI chat interactions
- **Embedding Service**: Converts text data into vector embeddings
- **Vector Search Service**: Performs similarity search on vector data
- **Chunk Generator**: Formats structured data into text chunks for embedding

### Data Layer
- **PostgreSQL Database**: Main relational database for user data, chats, messages
- **Vector Database (pgvector)**: Extension for storing and searching vector embeddings
- **Knowledge Chunks**: Structured storage of enterprise information as vectors

### External Services
- **LLM API**: Language model integration via ruby_llm gem

## Data Flow

1. **Data Ingestion**: Employee creates/updates enterprise data
2. **Chunk Generation**: Data is formatted into searchable text chunks
3. **Embedding Creation**: Chunks are converted to vector embeddings via LLM
4. **Vector Storage**: Embeddings stored in pgvector database
5. **Query Processing**: User asks question through chat interface
6. **Similarity Search**: Query converted to embedding and similar chunks retrieved
7. **Context Assembly**: Retrieved chunks assembled as context
8. **Response Generation**: LLM generates response based on context and query
9. **Real-time Delivery**: Response streamed to user via Turbo channels

## Security Model

- Role-based access control (Admin vs Employee)
- Namespace separation for different user types
- Devise authentication with confirmation
- Secure API integrations

## Technology Stack

- **Backend**: Ruby on Rails 8.0, PostgreSQL, pgvector
- **AI/ML**: ruby_llm gem, vector embeddings
- **Frontend**: Turbo, Stimulus, Simple Form
- **Deployment**: Kamal, Docker
- **Authentication**: Devise