FROM python:3.12-bookworm

RUN set -eux; \
	apt-get update; \
	apt-get install -y --no-install-recommends \
		ykcs11 \
	; \
	rm -rf /var/lib/apt/lists/*

COPY pyproject-to-requirements.py /usr/local/bin/

WORKDIR /tuf-on-ci

COPY signer/pyproject.toml ./
RUN pyproject-to-requirements.py > requirements.txt
RUN pip install --no-cache-dir -r requirements.txt
COPY signer .
RUN pip install --no-cache-dir .

CMD ["bash"]
