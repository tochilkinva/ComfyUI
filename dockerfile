FROM python:3.12-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

WORKDIR /opt/app

COPY requirements.txt requirements.txt

RUN apt-get update && apt-get install -y \
    && pip install --no-cache-dir --upgrade pip

RUN pip install torch torchvision torchaudio --index-url https://download.pytorch.org/whl/cpu
RUN pip install --no-cache-dir -r requirements.txt
    # git clone https://github.com/ltdrdata/ComfyUI-Manager.git
COPY . .

EXPOSE 8188

# ENTRYPOINT ["/bin/sh", "-c", " python main.py --cpu --cpu-vae --auto-launch"]
CMD ["python", "main.py", "--cpu", "--cpu-vae", "--auto-launch"]
# pip3 install torch==2.4.1+cpu torchvision==0.19.1+cpu torchaudio==2.4.1+cpu --index-url https://download.pytorch.org/whl/cpu
# CMD ["sh", "-c", "ls -l && sleep 60"]
