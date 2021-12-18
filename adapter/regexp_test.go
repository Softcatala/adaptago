package adapter

import (
	"testing"
)

func TestRegexp_AdaptString(t *testing.T) {

	tests := []struct {
		name    string
		re      string
		input   string
		output  string
		wantErr bool
	}{{
		"Empty input errors",
		"",
		"",
		"",
		true,
	}, {
		"Non empty input succeeds",
		"s/abc/xyz/g",
		"Hola",
		"Hola",
		false,
	}, {
		"Replace works",
		"s/abc/xyz/g",
		"foo abc bar",
		"foo xyz bar",
		false,
	}}
	for _, tt := range tests {
		t.Run(tt.name, func(t *testing.T) {

			var a *Regexp
			var err error
			var got string

			a, err = NewRegexp(tt.re)
			
			if err == nil {
				got, err = a.AdaptString(tt.input)
			}

			if (err != nil) != tt.wantErr {
				t.Errorf("AdaptString() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if tt.output != got {
				t.Errorf("AdaptString() got = %v, want %v", got, tt.output)
			}
		})
	}
}
