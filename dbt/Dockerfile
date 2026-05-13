FROM python:3.11-slim

# Install system dependencies
RUN apt-get update && apt-get install -y \
    git \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

# Create dbt user directory
RUN mkdir -p /home/dbt && chmod -R 777 /home/dbt

# Install dbt and dependencies
COPY dbt/requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /workspace

CMD ["/bin/bash"]
