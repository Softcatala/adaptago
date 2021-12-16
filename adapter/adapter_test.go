package adapter

import (
	"testing"
)

func Test_adapter_Adapt(t *testing.T) {
	type args struct {
		i string
	}
	tests := []struct {
		name      string
		sedString string
		input     string
		output    string
		wantErr   bool
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

			var a *adapter
			var err error
			var got *Result

			if tt.sedString != "" {
				a, err = New(tt.sedString)
			}

			if err == nil {
				got, err = a.Adapt(tt.input)
			}

			if (err != nil) != tt.wantErr {
				t.Errorf("Adapt() error = %v, wantErr %v", err, tt.wantErr)
				return
			}
			if tt.output != got.Adapted {
				t.Errorf("Adapt() got = %v, want %v", got.Adapted, tt.output)
			}
		})
	}
}
