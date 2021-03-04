from fpylll import IntegerMatrix, SVP
import sys

def svp(B):
	A = IntegerMatrix.from_matrix(B)
	return SVP.shortest_vector(A)

def first_primes(n):
	p = 1
	P = []
	while len(P) < n:
		p = next_prime(p)
		P += [p]
	return P

def is_smooth(x, P):
	y = x
	for p in P:
		while p.divides(y):
			y /= p
	return abs(y) == 1



# Test if a factoring relation was indeed found.
def test_Schnorr(N, n, prec=1000):
	P = first_primes(n)
	f = list(range(1, n+1))
	shuffle(f)

	# Scale up and round
	def sr(x):
		return round(x * 2^prec)

	diag = [sr(N*f[i]) for i in range(n)] + [sr(N*ln(N))]
	B = diagonal_matrix(diag, sparse=False)
	for i in range(n):
		B[i, n] = sr(N*ln(P[i]))


	b = svp(B)
	e = [b[i] / sr(N*f[i]) for i in range(n)]

	u = 1
	v = 1
	for i in range(n):
		assert e[i] in ZZ
		if e[i] > 0:
			u *= P[i]^e[i]
		if e[i] < 0:
			v *= P[i]^(-e[i])

	return is_smooth(u - v*N, P) 

try:
	bits = int(sys.argv[1])
except:
	bits = 400

try:
	n = int(sys.argv[2])
except:
	n = 47

try:
	trials = int(sys.argv[3])
except:
	trials = 100


print("Testing Schnorr's relation finding algorithm with n=%d on RSA-moduli of %d bits, %d trials"%(n, bits, trials))

successes = 0
for i in range(trials):
	p = random_prime(2^(bits/2), false, 2^(bits/2-1))
	q = random_prime(2^(bits/2), false, 2^(bits/2-1))
	N = p*q
	success = test_Schnorr(N, n)
	successes += success
	print(success, end="\t")
	sys.stdout.flush()

print("\n%d Factoring Relation found out of %d trials"%(successes, trials))