# **Student CRUD REST API** 🚀

A simple REST API for managing student records using **Flask**.

## **📌 Features**
- Add a new student
- Retrieve all students
- Retrieve a student by ID
- Update a student record
- Delete a student record
- API versioning (`/api/v1/`)
- Health check endpoint (`/healthcheck`)

---

## **📖 Setup Instructions**
### **1️⃣ Clone the Repository**
```bash
git clone https://github.com/your-username/student-api.git
cd student-api

## **📖 Docker Setup**
## **🐳 Running with Docker**
### **1️⃣ Build the Docker Image**
```bash
docker build -t student-api:1.0.0 .

## **2️⃣ Run the Container**
docker run -d -p 5000:5000 --env DATABASE_URL=sqlite:///students.db student-api:1.0.0

## **3️⃣ Stop the Container**
docker stop $(docker ps -q --filter ancestor=student-api:1.0.0)


---

### **Challenges & Solutions I Faced**  
❌ **Container not running** → Fixed by ensuring `FLASK_APP` was properly set.  
❌ **Large image size** → Used multi-stage builds to reduce it.  
❌ **Docker not passing environment variables** → Explicitly used `--env` flag when running the container.  

---

### **Final Thoughts**  
🔥 Successfully dockerized the Student REST API! Now, the API can run in any environment with just one command. Check out the project here:  
🔗 [GitHub Repository](https://github.com/your-username/student-api) 🚀🔥
